import 'dart:ui';

import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {

  final TextEditingController? controller;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;


  const TextFormFieldCustom({this.controller,this.onTap,this.keyboardType,
    this.label,this.validator,this.obscureText=false,this.suffixIcon,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      selectionHeightStyle: BoxHeightStyle.tight,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        //suffixIcon:obscureText? Icon(Icons.visibility_off_outlined,color: Colors.grey,):Icon(Icons.visibility,color: Colors.grey,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      validator: validator,
      obscuringCharacter: '*',
      obscureText: obscureText,
    );
  }
}
