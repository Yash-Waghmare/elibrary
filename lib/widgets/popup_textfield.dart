import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Use this textfield in popup
class PopUpTextfield extends StatelessWidget {
  const PopUpTextfield({
    super.key,
    required this.addRecordController,
    required this.hintText,
  });

  final TextEditingController addRecordController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: addRecordController,
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
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}
