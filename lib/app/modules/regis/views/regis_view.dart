import 'package:bubbme/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/textfield.dart';
import '../../../utils/keyboard_actions_config.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/regis_controller.dart';

class RegisView extends GetView<RegisController> {
  const RegisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardActions(
        config: buildKeyboardActionConfig(
          context,
          controller.nodePhone,
        ),
        autoScroll: false,
        disableScroll: true,
        child: Container(
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Text(
                            LocaleKeys.createAccount.tr.toUpperCase(),
                            style: blackSansitaRegularTextStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimens.title,
                            ),
                          ),
                          verticalSpace(64.0),
                          Image.asset(
                            AppImages.anteena,
                            width: 180.0,
                          ),
                          Text(
                            LocaleKeys.createAccountDesc.tr,
                            style: blackMediumTextStyle.copyWith(
                              fontSize: AppDimens.body,
                            ),
                          ),
                          verticalSpace(32.0),
                          Form(
                            key: controller.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                KTextField(
                                  isDense: true,
                                  maxLines: 1,
                                  borderRadius: AppDimens.radiusTextField,
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  backgroundColor: AppColors.white,
                                  placeholder: LocaleKeys.enterYourName.tr,
                                  validator: Validator.nameValidator.call,
                                ),
                                verticalSpace(16.0),
                                KTextField(
                                  isDense: true,
                                  maxLines: 1,
                                  borderRadius: AppDimens.radiusTextField,
                                  controller: controller.phoneController,
                                  focusNode: controller.nodePhone,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  backgroundColor: AppColors.white,
                                  placeholder: '+62',
                                  validator: Validator.phoneValidation.call,
                                ),
                                verticalSpace(16.0),
                                KTextField(
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
                                          controller.setDateSelected(
                                              value.toString());
                                        }
                                      },
                                    );
                                  },
                                  validator: Validator.requiredValidator.call,
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(32.0),
                          Obx(() {
                            final state = controller.regisState.value;

                            return state.when(
                              initial: () => CustomButton(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.validateForm();
                                },
                                position: 4.0.obs,
                                color: AppColors.brown,
                                colorShadow: AppColors.brownShadow,
                                label: LocaleKeys.send.tr.toUpperCase(),
                              ),
                              loading: () => showLoading,
                              success: (data) => const SizedBox(),
                              error: (error) {
                                return CustomButton(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    controller.validateForm();
                                  },
                                  position: 4.0.obs,
                                  color: AppColors.brown,
                                  colorShadow: AppColors.brownShadow,
                                  label: LocaleKeys.send.tr.toUpperCase(),
                                );
                              },
                            );
                          }),
                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
