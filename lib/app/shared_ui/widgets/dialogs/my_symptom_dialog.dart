import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/symptom.dart';
import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../buttons/custom_button.dart';

class MySymptomDialog extends StatefulWidget {
  final List<Symptom> periodSymptom;
  final List<Symptom> symptom;
  final Function(List<int>) onSaveTapped;

  const MySymptomDialog({
    super.key,
    required this.onSaveTapped,
    required this.periodSymptom,
    required this.symptom,
  });

  @override
  State<MySymptomDialog> createState() => _MySymptomDialogState();
}

class _MySymptomDialogState extends State<MySymptomDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();

  List<Symptom> listSymptomSelected = [];

  @override
  void initState() {
    super.initState();
    if (widget.periodSymptom.isNotEmpty) {
      for (var element in widget.periodSymptom) {
        for (var symptom in widget.symptom) {
          if (element.periodSymptomId == symptom.periodSymptomID) {
            listSymptomSelected.add(symptom);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Center(
        child: Container(
          width: screenWidth(context),
          decoration: BoxDecoration(
            color: AppColors.popupBackground,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: AppColors.popupBackground,
                offset: Offset(0, 12),
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: Get.back,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      horizontalSpace(8.0),
                      Text(
                        LocaleKeys.mySymptom.tr.toUpperCase(),
                        style: blackSansitaRegularTextStyle.copyWith(
                          fontSize: AppDimens.title,
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(AppDimens.paddingSmall),
                  SizedBox(
                    height: screenHeightPercentage(context, percentage: .5),
                    child: ListView.builder(
                      itemCount: widget.symptom.length,
                      itemBuilder: (context, index) {
                        final symptom = widget.symptom[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppDimens.spaceSmall,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteBox,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusButton),
                            ),
                            child: CheckboxListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 0.0,
                              ),
                              title: Text(
                                symptom.periodSymptomName ?? '',
                                style: primaryBoldTextStyle,
                              ),
                              value: listSymptomSelected.contains(symptom),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    listSymptomSelected.add(symptom);
                                  } else {
                                    listSymptomSelected.remove(symptom);
                                  }
                                });
                              },
                              activeColor: AppColors.primary,
                              checkColor: AppColors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(AppDimens.paddingSmall),
                  CustomButton(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final listSymptomId = listSymptomSelected
                          .map((e) => e.periodSymptomID!)
                          .toList();
                      widget.onSaveTapped(listSymptomId);
                    },
                    position: 4.0.obs,
                    color: AppColors.whiteBox,
                    colorShadow: AppColors.whiteBoxShadow,
                    label: LocaleKeys.save.tr.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
