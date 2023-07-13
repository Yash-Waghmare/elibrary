import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This file contains the popup textfield widget
// This widget is used to create a popup textfield
// This widget is customly created to use in hero dialog popups.

class PopUpTextfield extends StatelessWidget {
  const PopUpTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: readOnly ? null : controller,
      readOnly: readOnly,
      enabled: !readOnly,
      obscureText: isPassword,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: hintText,
          labelStyle: GoogleFonts.inter(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          alignLabelWithHint: true),
      textAlign: TextAlign.start,
      style: GoogleFonts.inter(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}
