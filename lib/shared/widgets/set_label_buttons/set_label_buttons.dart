import 'package:flutter/material.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'package:nlw_flutter_app/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter_app/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';

import '../divider/divider_vertical_widget.dart';
import '../label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons({Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 56,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 57,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                        label: primaryLabel,
                        onPressed: primaryOnPressed,
                      style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                    )),
                DividerVerticalWidget(),
                Expanded(
                    child: LabelButton(
                        label: secondaryLabel,
                        onPressed: secondaryOnPressed,
                        style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
