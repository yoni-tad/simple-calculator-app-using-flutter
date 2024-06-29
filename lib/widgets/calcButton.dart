import 'package:flutter/material.dart';

Widget calcButton(
  String btnText,
  Color btnColor,
  void Function()? buttonPressed,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 3,
      vertical: 4,
    ),
    child: Container(
      width: 72,
      height: btnText == '=' ? 140 : 65,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
