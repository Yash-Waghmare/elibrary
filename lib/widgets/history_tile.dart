import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/colors.dart';

// This file contains the history tile widget
// This widget is used to display the history of the user transactions
class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.id,
    required this.name,
    required this.bDate,
    required this.rDate,
  });
  final String id, name, bDate, rDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 75, right: 40),
            width: 50,
            child: Text(
              id,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            alignment: Alignment.center,
            width: 275,
            child: Text(
              name,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            child: Text(
              bDate,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 80),
            width: 100,
            child: Text(
              rDate.isNotEmpty ? rDate : '    -    ',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
