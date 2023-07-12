import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSubmit
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        cursorHeight: 27,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            fillColor: AppColors.colors.blue,
            contentPadding: const EdgeInsets.only(left: 30),
            suffixIcon: const Image(
              image: AssetImage(
                'icons/search.png',
              ),
              width: 25,
              height: 25,
            ),
            suffixIconConstraints: const BoxConstraints(minWidth: 60),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: hintText,
            labelStyle: GoogleFonts.inter(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
            alignLabelWithHint: true),
        textAlign: TextAlign.start,
        style: GoogleFonts.inter(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        onSubmitted: onSubmit,
      ),
    );
  }
}
