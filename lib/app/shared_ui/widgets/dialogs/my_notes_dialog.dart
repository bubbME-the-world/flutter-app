import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/period_note.dart';
import '../../../utils/ui_helpers.dart';
import '../../../utils/validator/validator.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../buttons/custom_button.dart';
import '../textfield.dart';

class MyNotesDialog extends StatefulWidget {
  final PeriodNote? periodNote;
  final Function(String) onSaveTapped;

  const MyNotesDialog({
    super.key,
    required this.onSaveTapped,
    required this.periodNote,
  });

  @override
  State<MyNotesDialog> createState() => _MyNotesDialogState();
}

class _MyNotesDialogState extends State<MyNotesDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.periodNote != null) {
      notesController.text = widget.periodNote?.periodNote ?? '';
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
                        LocaleKeys.myNotes.tr.toUpperCase(),
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
                              controller: notesController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              backgroundColor: AppColors.white,
                              placeholder: LocaleKeys.myNotePlaceholder.tr,
                              validator: Validator.requiredValidator.call,
                            ),
                          ),
                          verticalSpace(AppDimens.paddingBig),
                          CustomButton(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              validateForm(notesController.text);
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
