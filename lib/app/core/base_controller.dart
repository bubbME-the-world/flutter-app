import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../generated/locales.g.dart';
import '../constants/session.dart';
import '../di/injectore.dart';
import '../domain/entity/profile.dart';
import '../domain/usecases/profile_local_usecase.dart';
import '../routes/app_pages.dart';
import '../shared_ui/style/app_colors.dart';
import '../shared_ui/style/app_dimens.dart';
import '../shared_ui/style/app_images.dart';
import '../shared_ui/style/app_styles.dart';
import '../shared_ui/widgets/dialogs/loading_dialog.dart';
import '../utils/ui_helpers.dart';

class BaseController extends GetxController {
  final box = GetStorage();
  final _profileLocalUseCase = injector<ProfileLocalUseCase>();
  final _profileLocal = const Profile().obs;
  AudioPlayer? player;

  Profile get profileLocal => _profileLocal.value;

  set profileLocal(Profile value) => _profileLocal.value = value;

  final volume = 0.0.obs;

  Future<void> getProfileLocal() async {
    final result = await _profileLocalUseCase.execute();
    if (result != null) {
      profileLocal = result;
    }
  }

  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }

  void showHome() => Get.offAllNamed(Routes.HOME);

  void showFailed({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? LocaleKeys.failed.tr,
      message,
      duration: const Duration(milliseconds: 1000),
      titleText: Text(
        title ?? LocaleKeys.failed.tr,
        style: whiteMediumTextStyle.copyWith(fontSize: AppDimens.body),
      ),
      messageText: Text(
        message,
        style: whiteMediumTextStyle,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.error,
      colorText: AppColors.white,
      icon: SvgPicture.asset(AppImages.iconDangerous),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      borderRadius: AppDimens.radius,
    );
  }

  void showSuccess({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? LocaleKeys.success.tr,
      message,
      duration: const Duration(milliseconds: 800),
      titleText: Text(
        title ?? LocaleKeys.success.tr,
        style: whiteMediumTextStyle.copyWith(fontSize: AppDimens.body),
      ),
      messageText: Text(
        message,
        style: whiteMediumTextStyle,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
      icon: SvgPicture.asset(AppImages.iconInformation),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      borderRadius: AppDimens.radius,
    );
  }

  void showLoadingDialog() => Get.dialog(
        barrierDismissible: false,
        const LoadingDialog(),
      );

  void hideLoadingDialog() => Get.back();

  void showToast({required String message}) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   backgroundColor: AppColors.black,
    //   textColor: AppColors.white,
    // );
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  void setAudio(String source) {
    player = AudioPlayer();

    player?.setReleaseMode(ReleaseMode.loop);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player?.setSource(AssetSource(source));
      await player?.resume();
    });
    double initVolume = box.read(Session.volume) ?? 0.5;
    print("Volume: $initVolume");
    setAudioVolume(initVolume);
  }

  void setAudioVolume(double volume) {
    this.volume.value = volume;
    box.write(Session.volume, volume);
    update();
    player?.setVolume(volume);
  }

  void showSettingDialog() {
    Get.dialog(
      Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Center(
            child: Container(
              width: screenWidth(Get.context!),
              decoration: BoxDecoration(
                color: AppColors.brown,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brownShadow,
                    offset: const Offset(0, 12),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImages.iconVolume,
                            width: 24.0,
                          ),
                          horizontalSpace(16.0),
                          Flexible(
                            child: Slider(
                              min: 0,
                              max: 1,
                              onChanged: (double volume) {
                                setAudioVolume(volume);
                              },
                              value: volume.value,
                              activeColor: AppColors.primary,
                              thumbColor: AppColors.primaryAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
