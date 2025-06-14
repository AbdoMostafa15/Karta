import 'package:flutter/material.dart';
import 'package:karta/core/utils/colors.dart';
import 'package:karta/core/utils/text_style.dart';

void showErrorDialog(
  BuildContext context,
  String message, {
  Widget? actionButton,
  double textSize = 48,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close),
              ),
            ),
            Icon(
              Icons.warning_amber_rounded,
              size: 100,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 5),
            Text("Error", style: jumheriaTextStyle()),
            SizedBox(height: 3),
            Text(
              message,
              style: jumheriaTextStyle().copyWith(fontSize: textSize),
              textAlign: TextAlign.center,
            ),
            if (actionButton != null) ...[actionButton],
          ],
        ),
      );
    },
  );
}
