import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Use this textfield in popup
class PopUpTextfield extends StatelessWidget {
  const PopUpTextfield({
    super.key,
    required this.controller,
    required this.hintText, this.readOnly=false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      enabled: !readOnly,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
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
