import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;
  const ElevatedButtonCustom({required this.onPressed,required this.child,
    this.backgroundColor,this.foregroundColor,this.height=25,this.width=300,super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: Size(width, height),
      ),
        onPressed: onPressed,
        child: child,

    );
  }
}
