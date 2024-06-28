import 'package:flutter/material.dart';

Widget calcButton(
  String btnText,
  Color btnColor,
  void Function()? buttonPressed,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 2,
      vertical: 3,
    ),
    child: Container(
      width: 75,
      height: btnText == '=' ? 150 : 70,
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
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
