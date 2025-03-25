import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ElevatedButtonWidget({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        elevation: 1,
        backgroundColor: Color(0xff23211F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2)
        ),
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)
      ),
      child: child
    );
  }
}