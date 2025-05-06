import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/regis_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/usecases/regis_usecase.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/widgets/dialogs/information_dialog.dart';

class RegisController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final FocusNode nodePhone = FocusNode();

  final _regisUseCase = injector<RegisUseCase>();

  final regisState = const RequestState.initial().obs;

  final dateSelected = "".obs;

  void setDateSelected(String date) {
    dateOfBirthController.text = date.formatTime();
    dateSelected.value = date.formatTimeAPI();
  }

  void validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      regis();
    }
  }

  Future<void> regis() async {
    regisState.value = const RequestState.loading();

    final deviceId = await getDeviceId();
    final request = RegisRequest(
      userName: nameController.text,
      userPhone: phoneController.text,
      birthdayDate: dateSelected.value,
      deviceId: deviceId,
    );
    final result = await _regisUseCase.execute(request);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showRegisError(errorMessage ?? '');
        regisState.value = RequestState.error(errorMessage);
      },
      (data) {
        showVerifyOTP();
        regisState.value = RequestState.success(data);
      },
    );
  }

  void showVerifyOTP() => Get.toNamed(
        Routes.OTP,
        arguments: phoneController.text,
      );

  void showRegisError(String message) {
    Get.dialog(
      InformationDialog(message: message),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    nodePhone.dispose();
    super.onClose();
  }
}
