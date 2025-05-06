import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:bubbme/app/shared_ui/style/app_audios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/session.dart';
import '../../../core/base_controller.dart';
import '../../../data/model/requests/login_email_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/usecases/login_email_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/widgets/dialogs/information_dialog.dart';

class LoginV2Controller extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _loginEmailUseCase = injector<LoginEmailUseCase>();

  // final loginState = const RequestState<Token>.loading().obs;
  final obscure = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    setAudio(AppAudios.authSong);
  }

  Future<void> validateForm() async {
    if (formKey.currentState?.validate() ?? false) {
      login();
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    final request = LoginEmailRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await _loginEmailUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        final statusCode = e.errorRes?.code ?? 0;
        showLoginError('Invaid Email / Password!', statusCode);
        // loginState.value = RequestState.error(errorMessage);
      },
      (data) {
        box.write(Session.token, data.accessToken);
        showMood();
        // loginState.value = RequestState<Token>.success(data);
      },
    );
    isLoading.value = false;
    update();
  }

  void showLoginError(String message, int statusCode) {
    Get.dialog(
      InformationDialog(
        message: message,
        onTap: () => Get.back(),
      ),
    );
  }

  void showMood() => Get.offAllNamed(Routes.MOOD);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
