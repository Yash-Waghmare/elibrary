import 'package:elibrary/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget Caller
// CustomButton(
// height: MediaQuery.sizeOf(context).width*0.025,
// width: MediaQuery.sizeOf(context).width*0.085,
// buttonText: status?"Returned":"Return",
// buttonColor: status?AppColors.colors.green:AppColors.colors.red,
// function: status?(){}:(){
// // Add function to return the book
// },
// )
class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.function,
      required this.fsize,
      required this.height,
        required this.fWeight,
      required this.width})
      : super(key: key);

  String buttonText;
  Color buttonColor, textColor;
  void Function() function;
  double height, width;
  double fsize;
  FontWeight fWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      // color: AppColors.colors.darkShade,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2.5),
      ),
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return buttonColor;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(height / 2.5)))),
          child: Text(
            buttonText,
            style: GoogleFonts.inter(
                fontSize: fsize, color: textColor, fontWeight:fWeight),
          )),
    );
  }
}
