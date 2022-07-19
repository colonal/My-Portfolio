import 'package:flutter/material.dart';

class SnakBarMessage {
  static void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    });
  }
}
