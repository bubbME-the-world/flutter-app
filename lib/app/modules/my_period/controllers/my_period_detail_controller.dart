import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../data/model/requests/period_request.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/period.dart';
import '../../../domain/entity/period_data.dart';
import '../../../domain/usecases/add_period_usecase.dart';
import '../../../domain/usecases/period_usecase.dart';
import '../../my_record/controllers/my_record_menu_controller.dart';

class MyPeriodDetailController extends BaseController {
  final _periodUseCase = injector<PeriodUseCase>();
  final _addPeriodUseCase = injector<AddPeriodUseCase>();

  final periodState = const RequestState<PeriodData>.loading().obs;

  final period = Rx<PeriodData?>(null);
  final dateSelected = Rx<DateTime?>(null);
  final listPeriodByMount = Rx<List<Period>?>(null);
  final periodSelected = Rx<Period?>(null);
  final currentPeriod = Rx<Period?>(null);

  final ItemScrollController itemScrollController = ItemScrollController();

  late DateTime lastDayOfMonth;
  final currentDate = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getProfileLocal();
    final List<dynamic> args = Get.arguments;
    dateSelected.value = args[0] as DateTime;
    period.value = args[1] as PeriodData;
    period.value?.listCurrentPeriod?.forEach((element) {
      if (element.batchPeriod == '') {
        currentPeriod.value = element;
      }
    });
    getPeriod();
    lastDayOfMonth = DateTime(
      dateSelected.value!.year,
      dateSelected.value!.month + 1,
      0,
    );
    currentDate.value = dateSelected.value!.day - 1;
  }

  void setFilterDataOPeriod() {
    listPeriodByMount.value = filterPeriodByMount();
    filterPeriodByDay();
    update();
  }

  List<Period>? filterPeriodByMount() {
    final dateFilterSelected = dateSelected.value!.subtract(
      Duration(days: 1),
    );
    List<Period>? filteredData = period.value?.data?.where((item) {
      DateTime startPeriod = DateTime.parse(item.startPeriod ?? '');
      return startPeriod.year == dateFilterSelected.year &&
          startPeriod.month == dateFilterSelected.month;
    }).toList();
    return filteredData;
  }

  void filterPeriodByDay() {
    final startDaySelected = currentDate.value + 2;
    final endDaySelected = currentDate.value + 1;
    DateTime filterStartDate = DateTime(
      dateSelected.value!.year,
      dateSelected.value!.month,
      startDaySelected,
    );
    DateTime filterEndDate = DateTime(
      dateSelected.value!.year,
      dateSelected.value!.month,
      endDaySelected,
    );
    List<Period>? filteredByDay = listPeriodByMount.value?.where((item) {
      DateTime startPeriod = DateTime.parse(item.startPeriod ?? '');
      DateTime endPeriod = DateTime.parse(item.endPeriod ?? '');
      return filterStartDate.isAfter(startPeriod) &&
              filterEndDate.isBefore(endPeriod) ||
          filterStartDate.isAtSameMomentAs(startPeriod) ||
          filterEndDate.isAtSameMomentAs(endPeriod);
    }).toList();
    if (filteredByDay?.isEmpty ?? true) {
      periodSelected.value = null;
      if (currentPeriod.value != null) filerCurrentPeriodByDay();
      // filerCurrentPeriodByDay();
      return;
    }
    Get.lazyPut<MyRecordMenuController>(
      () => MyRecordMenuController(),
    );
    periodSelected.value = filteredByDay?.first;
    update();
  }

  void filerCurrentPeriodByDay() {
    final startDaySelected = currentDate.value + 2;
    DateTime filterStartDate = DateTime(
      dateSelected.value!.year,
      dateSelected.value!.month,
      startDaySelected,
    );
    DateTime startPeriod =
        DateTime.parse(currentPeriod.value?.startPeriod ?? '');

    if (filterStartDate.isAfter(startPeriod) ||
        filterStartDate.isAtSameMomentAs(startPeriod)) {
      Get.lazyPut<MyRecordMenuController>(
        () => MyRecordMenuController(),
      );
      periodSelected.value = currentPeriod.value;
      update();
    } else {
      periodSelected.value = null;
      update();
    }
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
        data.listCurrentPeriod?.forEach((element) {
          if (element.batchPeriod == '') {
            currentPeriod.value = element;
          }
        });
        setFilterDataOPeriod();
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
      (data) {
        getPeriod();
        if (endDate != null) {
          Get.back(result: true);
        }
      },
    );
  }

  bool isCanEndPeriod() {
    bool isCanEndPeriod = false;
    period.value?.listCurrentPeriod?.forEach((element) {
      if (element.batchPeriod == '') {
        currentPeriod.value = element;
        final daySelected = currentDate.value + 1;
        DateTime filterDate = DateTime(
          dateSelected.value!.year,
          dateSelected.value!.month,
          daySelected,
        );

        DateTime startPeriod =
        DateTime.parse(currentPeriod.value?.startPeriod ?? '');
        isCanEndPeriod = filterDate.isBefore(startPeriod);
        return;
      }
    });
    return isCanEndPeriod;
  }
}
