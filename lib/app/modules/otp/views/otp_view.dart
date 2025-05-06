import 'package:bubbme/app/shared_ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:pinput/pinput.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/keyboard_actions_config.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardActions(
        config: buildKeyboardActionConfig(
          context,
          controller.nodeCode,
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
                            LocaleKeys.codeOTP.tr.toUpperCase(),
                            style: blackSansitaRegularTextStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimens.title,
                            ),
                          ),
                          verticalSpace(72.0),
                          Image.asset(
                            AppImages.anteena,
                            width: 180.0,
                          ),
                          Obx(() {
                            return Text(
                              '${LocaleKeys.codeOTPDesc.tr} ${controller.phoneNumber.value}',
                              style: blackMediumTextStyle.copyWith(
                                fontSize: AppDimens.body,
                              ),
                              textAlign: TextAlign.center,
                            );
                          }),
                          verticalSpace(48.0),
                          Form(
                            key: controller.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Pinput(
                              length: 6,
                              focusNode: controller.nodeCode,
                              controller: controller.codeController,
                              pinAnimationType: PinAnimationType.slide,
                              defaultPinTheme: PinTheme(
                                width: 24,
                                height: 24,
                                textStyle: blackBoldTextStyle.copyWith(
                                  fontSize: AppDimens.body,
                                ),
                                decoration: const BoxDecoration(),
                              ),
                              showCursor: true,
                              validator: Validator.requiredOTPValidator.call,
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                              preFilledWidget: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryAccent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(48.0),
                          CustomButton(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.validateForm();
                            },
                            position: 4.0.obs,
                            color: AppColors.brown,
                            colorShadow: AppColors.brownShadow,
                            label: LocaleKeys.verify.tr.toUpperCase(),
                          ),
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
