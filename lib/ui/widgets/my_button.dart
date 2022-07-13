import 'package:diagnostics/constants/application_constants.dart' as application_constants;
import 'package:diagnostics/ui/styles.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: application_constants.primaryColor),
        child: Center(
          child: Text(
            label,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
