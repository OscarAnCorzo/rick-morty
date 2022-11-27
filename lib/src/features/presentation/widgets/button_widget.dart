import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Button({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      // elevation: this.disabled || this.loading
      //   ? 0.0
      //   : 6.0,
      color:  Color(0xff12555F),
      // minWidth: minWidth,
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600
        )
      ),
      onPressed: this.onPressed
    );
  }
}