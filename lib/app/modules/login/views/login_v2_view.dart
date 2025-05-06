import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/icon_setting.dart';
import '../../../shared_ui/widgets/textfield.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/login_v2_controller.dart';

class LoginV2View extends GetView<LoginV2Controller> {
  const LoginV2View({super.key});

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
                    child: Obx(
                      () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.login.tr.toUpperCase(),
                              style: blackSansitaRegularTextStyle.copyWith(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            verticalSpace(52.0),
                            Image.asset(
                              AppImages.headAnteena2,
                              width: 180.0,
                            ),
                            Form(
                              key: controller.formKey,
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
                            verticalSpace(32.0),
                            controller.isLoading.value
                                ? showLoading
                                : CustomButton(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      controller.validateForm();
                                    },
                                    height: 58.0,
                                    width: screenWidthPercentage(context,
                                        percentage: .7),
                                    position: 4.0.obs,
                                    color: AppColors.brown,
                                    colorShadow: AppColors.brownShadow,
                                    label: LocaleKeys.login.tr.toUpperCase(),
                                  ),
                          ],
                        );
                      },
                    ),
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
              Positioned(
                top: 8.0,
                right: 8.0,
                child: GestureDetector(
                  onTap: () => controller.showSettingDialog(),
                  child: IconSetting(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
