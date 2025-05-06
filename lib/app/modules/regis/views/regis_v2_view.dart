import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/textfield.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/regis_v2_controller.dart';

class RegisV2View extends GetView<RegisV2Controller> {
  const RegisV2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Obx(() {
                      final stepTitle =
                          controller.regisStep[controller.currentIndex.value];
                      final state = controller.regisState.value;
                      return Column(
                        children: [
                          Text(
                            stepTitle.toUpperCase(),
                            style: blackSansitaRegularTextStyle.copyWith(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          verticalSpace(52.0),
                          Image.asset(
                            AppImages.anteena,
                            width: 180.0,
                          ),
                          if (controller.currentIndex.value == 0)
                            Form(
                              key: controller.formKeyOne,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                children: [
                                  KTextField(
                                    isDense: true,
                                    maxLines: 1,
                                    borderRadius: AppDimens.radiusTextField,
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    backgroundColor: AppColors.white,
                                    placeholder: 'Email',
                                    validator: Validator.emailValidator.call,
                                  ),
                                  verticalSpace(16.0),
                                  KTextField(
                                    isDense: true,
                                    maxLines: 1,
                                    borderRadius: AppDimens.radiusTextField,
                                    controller: controller.passwordController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    backgroundColor: AppColors.white,
                                    placeholder: 'Password',
                                    validator: Validator.passwordValidator.call,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.obscure.toggle();
                                      },
                                      icon: Icon(
                                        controller.obscure.isTrue
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    obscure: controller.obscure.value,
                                  ),
                                ],
                              ),
                            ),
                          if (controller.currentIndex.value == 1)
                            Form(
                              key: controller.formKeyTwo,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: KTextField(
                                isDense: true,
                                maxLines: 1,
                                borderRadius: AppDimens.radiusTextField,
                                controller: controller.usernameController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                backgroundColor: AppColors.white,
                                placeholder: 'Username',
                                validator: Validator.nameValidator.call,
                              ),
                            ),
                          if (controller.currentIndex.value == 2)
                            Form(
                              key: controller.formKeyThree,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: KTextField(
                                isDense: true,
                                maxLines: 1,
                                isOption: true,
                                borderRadius: AppDimens.radiusTextField,
                                controller: controller.dateOfBirthController,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.done,
                                backgroundColor: AppColors.white,
                                placeholder: LocaleKeys.dateOfBirth.tr,
                                suffixIcon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: AppColors.primary,
                                ),
                                onTap: () {
                                  showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: calenderTheme,
                                        ),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  ).then(
                                    (value) {
                                      if (value != null) {
                                        controller
                                            .setDateSelected(value.toString());
                                      }
                                    },
                                  );
                                },
                                validator: Validator.requiredValidator.call,
                              ),
                            ),
                          verticalSpace(32.0),
                          state.when(
                            initial: () => CustomButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.validateAndNext();
                              },
                              height: 58.0,
                              width: screenWidthPercentage(context,
                                  percentage: .7),
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.submit.tr.toUpperCase(),
                            ),
                            loading: () => showLoading,
                            success: (data) => const SizedBox(),
                            error: (error) => CustomButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.validateAndNext();
                              },
                              height: 58.0,
                              width: screenWidthPercentage(context,
                                  percentage: .7),
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.submit.tr.toUpperCase(),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Image.asset(
                    AppImages.iconBack,
                    width: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
