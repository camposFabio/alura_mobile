import 'package:flutter/material.dart';
import 'response_dialog.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const SuccessDialog({
    Key? key,
    required this.message,
    this.title = 'Success',
    this.icon = Icons.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}
