import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';
import 'custom_button.dart';

class DashBoardTile extends StatelessWidget {
  const DashBoardTile(
      {super.key,
      required this.title,
      required this.number,
      required this.onTap});
  final String title, number;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.colors.tileBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                title,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  buttonText: 'See More',
                  buttonColor: AppColors.colors.buttonBackground,
                  function: onTap,
                  height: 25,
                  width: 100,
                  fsize: 14,
                  textColor: Colors.white,
                  fWeight: FontWeight.w400,
                ),
                Text(
                  number,
                  style: GoogleFonts.inter(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ]),
    );
  }
}
