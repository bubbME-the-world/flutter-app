import 'package:bubbme/app/constants/status_code_constants.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants/session.dart';
import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/login_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/token.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/widgets/dialogs/information_dialog.dart';

class LoginController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final FocusNode nodePhone = FocusNode();

  final _loginUseCase = injector<LoginUseCase>();

  final loginState = const RequestState<Token>.initial().obs;

  Future<void> validateForm() async {
    if (formKey.currentState?.validate() ?? false) {
      login();
    }
  }

  Future<void> login() async {
    loginState.value = const RequestState<Token>.loading();

    final deviceId = await getDeviceId();
    final request = LoginRequest(
      userPhone: phoneController.text,
      deviceId: deviceId,
    );
    final result = await _loginUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        final statusCode = e.errorRes?.code ?? 0;
        showLoginError(errorMessage ?? '', statusCode);
        loginState.value = RequestState.error(errorMessage);
      },
      (data) {
        box.write(Session.token, data.accessToken);
        showMood();
        loginState.value = RequestState<Token>.success(data);
      },
    );
  }

  void showLoginError(String message, int statusCode) {
    Get.dialog(
      InformationDialog(
        message: message,
        onTap: () {
          Get.back();
          if (statusCode == StatusCodeConstants.bedRequestNeedVerify) {
            showVerifyOTP();
          }
        },
      ),
    );
  }

  void showRegis() => Get.toNamed(Routes.REGIS);

  void showMood() => Get.offAllNamed(Routes.MOOD);

  void showVerifyOTP() => Get.toNamed(
        Routes.OTP,
        arguments: phoneController.text,
      );

  @override
  void onClose() {
    phoneController.dispose();
    nodePhone.dispose();
    super.onClose();
  }
}
