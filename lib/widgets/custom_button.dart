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
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.function,
      required this.fsize,
      required this.height,
      required this.fWeight,
      required this.width,
      this.needCursor = true})
      : super(key: key);

  final String buttonText;
  final Color buttonColor, textColor;
  final void Function() function;
  final double height, width;
  final double fsize;
  final FontWeight fWeight;
  final bool needCursor;

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
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height / 2.5)),
              enabledMouseCursor: needCursor
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.forbidden),
          child: Text(
            buttonText,
            style: GoogleFonts.inter(
                fontSize: fsize, color: textColor, fontWeight: fWeight),
          )),
    );
  }
}
