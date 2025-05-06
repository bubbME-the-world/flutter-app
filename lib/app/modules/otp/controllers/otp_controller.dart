import 'package:bubbme/app/core/base_controller.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/session.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/otp_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/widgets/dialogs/information_dialog.dart';

class OtpController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController codeController = TextEditingController();
  final FocusNode nodeCode = FocusNode();

  final _verifyOTPUseCase = injector<VerifyOTPUseCase>();

  final verifyOTPState = const RequestState.initial().obs;
  final phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    phoneNumber.value = Get.arguments as String;
  }

  void validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      verifyOTP();
    }
  }

  Future<void> verifyOTP() async {
    verifyOTPState.value = const RequestState.loading();

    final deviceId = await getDeviceId();
    final request = OTPRequest(
      userPhone: phoneNumber.value,
      otp: codeController.text,
      deviceId: deviceId,
    );
    final result = await _verifyOTPUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showVerifyOTPError(errorMessage ?? '');
        verifyOTPState.value = RequestState.error(errorMessage);
      },
      (data) {
        box.write(Session.token, data.accessToken);
        showMood();
        verifyOTPState.value = RequestState.success(data);
      },
    );
  }

  void showMood() => Get.offNamed(Routes.MOOD);

  void showVerifyOTPError(String message) {
    Get.dialog(
      InformationDialog(message: message),
    );
  }

  @override
  void onClose() {
    codeController.dispose();
    nodeCode.dispose();
    super.onClose();
  }
}
