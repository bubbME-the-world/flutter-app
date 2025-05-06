import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/period_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/period.dart';
import '../../../domain/entity/period_data.dart';
import '../../../domain/usecases/add_period_usecase.dart';
import '../../../domain/usecases/period_usecase.dart';
import '../../../routes/app_pages.dart';

class MyPeriodController extends BaseController {
  final _periodUseCase = injector<PeriodUseCase>();
  final _addPeriodUseCase = injector<AddPeriodUseCase>();

  final periodState = const RequestState<PeriodData>.loading().obs;

  final period = Rx<PeriodData?>(null);
  final currentPeriod = Rx<Period?>(null);

  @override
  onInit() {
    super.onInit();
    getPeriod();
    getProfileLocal();
  }

  Future<void> getPeriod() async {
    final result = await _periodUseCase.execute();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        periodState.value = RequestState.error(errorMessage);
      },
      (data) {
        period.value = data;
        if (data.listCurrentPeriod != null) {
          data.listCurrentPeriod?.forEach((element) {
            if (element.batchPeriod == '') {
              currentPeriod.value = element;
            }
          });
        }
        periodState.value = RequestState<PeriodData>.success(data);
      },
    );
  }

  Future<void> addPeriod({
    String? startDate,
    String? endDate,
  }) async {
    showLoadingDialog();
    final request = PeriodRequest(
      startPeriod: startDate,
      endPeriod: endDate,
    );
    final result = await _addPeriodUseCase.execute(request);
    hideLoadingDialog();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        showFailed(title: LocaleKeys.failed.tr, message: errorMessage ?? '');
      },
      (data) => getPeriod(),
    );
  }

  String getPeriodDayCount(String startDatePeriod) {
    DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(startDatePeriod);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime startDay =
        DateTime(startDate.year, startDate.month, startDate.day);
    int dayCount = today.difference(startDay).inDays + 1;
    return dayCount.toString();
  }

  void showMyRecord(List<Period> records) {
    Get.toNamed(
      Routes.MY_RECORD,
      arguments: records,
    );
  }

  void showMyPeriodCalendar() => Get.toNamed(
        Routes.MY_PERIOD_CALENDAR,
        arguments: period.value,
      )?.then((value) {
        getPeriod();
      });
}
