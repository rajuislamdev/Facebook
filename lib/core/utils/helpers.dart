import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  bool? isSuccess,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
}
