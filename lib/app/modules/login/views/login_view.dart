import 'package:bubbme/app/shared_ui/style/app_colors.dart';
import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:bubbme/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/textfield.dart';
import '../../../utils/keyboard_actions_config.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logoTagLine),
                      verticalSpace(72.0),
                      Image.asset(
                        AppImages.anteena,
                        width: 180.0,
                      ),
                      Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: AppDimens.radiusTextField,
                          controller: controller.phoneController,
                          focusNode: controller.nodePhone,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          backgroundColor: AppColors.white,
                          placeholder: '+62',
                          validator: Validator.phoneValidation.call,
                        ),
                      ),
                      verticalSpace(24.0),
                      Obx(
                        () {
                          final state = controller.loginState.value;

                          return state.when(
                            initial: () => CustomButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.validateForm();
                              },
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.login.tr.toUpperCase(),
                            ),
                            loading: () => showLoading,
                            success: (data) => const SizedBox(),
                            error: (error) {
                              return CustomButton(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.validateForm();
                                },
                                position: 4.0.obs,
                                color: AppColors.brown,
                                colorShadow: AppColors.brownShadow,
                                label: LocaleKeys.login.tr.toUpperCase(),
                              );
                            },
                          );
                        },
                      ),
                      verticalSpace(72.0),
                      Text(
                        LocaleKeys.noHaveAccount.tr,
                        style: blackMediumTextStyle.copyWith(
                          fontSize: AppDimens.body,
                        ),
                      ),
                      verticalSpace(4.0),
                      TextButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.showRegis();
                        },
                        child: Text(
                          LocaleKeys.signUp.tr,
                          style: blackRegularTextStyle.copyWith(
                            fontSize: AppDimens.body,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
