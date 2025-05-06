import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/regis_email_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/usecases/regis_email_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_audios.dart';
import '../../../shared_ui/widgets/dialogs/information_dialog.dart';

class RegisV2Controller extends BaseController {
  final GlobalKey<FormState> formKeyOne = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyTwo = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyThree = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  final _regisEmailUseCase = injector<RegisEmailUseCase>();

  final regisState = const RequestState.initial().obs;

  final obscure = true.obs;
  final dateSelected = "".obs;

  List<String> regisStep = [
    LocaleKeys.regisOne.tr,
    LocaleKeys.regisTwo.tr,
    LocaleKeys.regisThree.tr,
  ];

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    setAudio(AppAudios.authSong);
  }

  void validateAndNext() {
    switch (currentIndex.value) {
      case 0:
        validateStepOne();
        break;
      case 1:
        validateStepTwo();
        break;
      case 2:
        validateAndNextThree();
        break;
    }
  }

  void validateStepOne() {
    if (formKeyOne.currentState?.validate() ?? false) {
      currentIndex.value = 1;
    }
  }

  void validateStepTwo() {
    if (formKeyTwo.currentState?.validate() ?? false) {
      currentIndex.value = 2;
    }
  }

  void validateAndNextThree() {
    if (formKeyThree.currentState?.validate() ?? false) {
      regis();
    }
  }

  void setDateSelected(String date) {
    dateOfBirthController.text = date.formatTime();
    dateSelected.value = date.formatTimeAPI();
  }

  Future<void> regis() async {
    regisState.value = const RequestState.loading();

    final deviceId = await getDeviceId();
    final request = RegisEmailRequest(
      userEmail: emailController.text,
      password: passwordController.text,
      userName: usernameController.text,
      birthdayDate: dateSelected.value,
      deviceId: deviceId,
    );
    final result = await _regisEmailUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showRegisError(errorMessage ?? '');
        regisState.value = RequestState.error(errorMessage);
      },
      (data) {
        showRegisSuccess();
        regisState.value = RequestState.success(data);
      },
    );
  }

  void showRegisError(String message) {
    Get.dialog(
      InformationDialog(message: message),
    );
  }

  void showRegisSuccess() {
    Get.dialog(
      InformationDialog(
        message: LocaleKeys.regisSuccess.tr,
        onTap: () {
          Get.back();
          Get.offAllNamed(Routes.LANDING);
        },
      ),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
}
