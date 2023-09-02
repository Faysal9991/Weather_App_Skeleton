import 'package:flutter/material.dart';
import 'package:weather_app/util/theme/app_colors.dart';


void showMessage({required String message, bool isError = true, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message, style: const TextStyle(color: Colors.white)), backgroundColor: isError ? Colors.red : AppColors.primaryColorDark),
  );
}
