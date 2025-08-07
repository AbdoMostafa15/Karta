import 'package:flutter/material.dart';

void showCustomBottomSheet(
  BuildContext context, {
  required Widget content,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: content,
      );
    },
  );
}
