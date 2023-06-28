import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.idController,
    required this.hintText,
  });

  final TextEditingController idController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: TextField(
        controller: idController,
        cursorColor: Colors.black,
        cursorHeight: 27,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            filled: true,
            fillColor: AppColors.colors.blue,
            contentPadding: EdgeInsets.only(left: 30),
            suffixIcon: Image(
              image: AssetImage(
                'icons/search.png',
              ),
              width: 25,
              height: 25,
            ),
            suffixIconConstraints: BoxConstraints(minWidth: 60),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: hintText,
            labelStyle: GoogleFonts.inter(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
            alignLabelWithHint: true),
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
