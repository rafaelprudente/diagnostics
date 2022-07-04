import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
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
        margin: const EdgeInsets.all(8.0),
        width: 100,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: appearance_constants.primarySwatch),
        child:Center( child: Text(
          label,
          style: buttonTextStyle,
        ),),
      ),
    );
  }
}
