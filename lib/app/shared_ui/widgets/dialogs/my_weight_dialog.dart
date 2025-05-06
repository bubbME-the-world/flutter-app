import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/period_weight.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../buttons/custom_button.dart';
import '../textfield.dart';

class MyWeightDialog extends StatefulWidget {
  final PeriodWeight? periodWeight;
  final Function(String) onSaveTapped;

  const MyWeightDialog({
    super.key,
    required this.onSaveTapped,
    this.periodWeight,
  });

  @override
  State<MyWeightDialog> createState() => _MyWeightDialogState();
}

class _MyWeightDialogState extends State<MyWeightDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.periodWeight != null) {
      weightController.text = widget.periodWeight?.periodWeight ?? '';
    }
  }

  Future<void> validateForm(String note) async {
    if (formKey.currentState?.validate() ?? false) {
      widget.onSaveTapped(note);
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
                        LocaleKeys.myWeight.tr.toUpperCase(),
                        style: blackSansitaRegularTextStyle.copyWith(
                          fontSize: AppDimens.title,
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(AppDimens.paddingSmall),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: KTextField(
                      isDense: true,
                      maxLines: 1,
                      borderRadius: AppDimens.radiusTextField,
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      backgroundColor: AppColors.white,
                      placeholder: LocaleKeys.myWeightPlaceholder.tr,
                      validator: Validator.requiredValidator.call,
                    ),
                  ),
                  SizedBox(
                    height: screenHeightPercentage(
                      context,
                      percentage: 0.2,
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      validateForm(weightController.text);
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
