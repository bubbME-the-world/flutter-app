import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/period_pills.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../buttons/custom_button.dart';
import '../textfield.dart';

class MyPillsDialog extends StatefulWidget {
  final PeriodPills? periodPills;
  final Function(String) onSaveTapped;

  const MyPillsDialog({
    super.key,
    required this.onSaveTapped,
    required this.periodPills,
  });

  @override
  State<MyPillsDialog> createState() => _MyPillsDialogState();
}

class _MyPillsDialogState extends State<MyPillsDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController pillsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.periodPills != null) {
      pillsController.text = widget.periodPills?.periodPills ?? '';
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
                        LocaleKeys.myPills.tr.toUpperCase(),
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
                    height: screenHeightPercentage(
                      context,
                      percentage: 0.6,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: KTextField(
                              isDense: true,
                              maxLines: 10,
                              minLines: 8,
                              borderRadius: AppDimens.radiusTextField,
                              controller: pillsController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              backgroundColor: AppColors.white,
                              placeholder: LocaleKeys.myPillsPlaceholder.tr,
                              validator: Validator.requiredValidator.call,
                            ),
                          ),
                          verticalSpace(AppDimens.paddingBig),
                          CustomButton(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              validateForm(pillsController.text);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
