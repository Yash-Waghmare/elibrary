import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/student_details_tile.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomButton(
                    buttonText: 'Add Student',
                    buttonColor: AppColors.colors.green,
                    textColor: AppColors.colors.black,
                    function: () {},
                    height: 50,
                    width: 200, fsize: 20, fWeight: FontWeight.w500,),
                CustomButton(
                  buttonText: 'Update Student',
                  buttonColor: AppColors.colors.yellow,
                  textColor: AppColors.colors.black,
                  function: () {},
                  height: 50,
                  width: 200, fsize: 20, fWeight: FontWeight.w500,),
                CustomButton(
                  buttonText: 'Remove Student',
                  buttonColor: AppColors.colors.red,
                  textColor: AppColors.colors.black,
                  function: () {},
                  height: 50,
                  width: 200, fsize: 20, fWeight: FontWeight.w500,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Student ID',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Contact Number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StudentDetailsTile(
              studentId: "1",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
            ),StudentDetailsTile(
              studentId: "2",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
            ),StudentDetailsTile(
              studentId: "3",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
            ),StudentDetailsTile(
              studentId: "4",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
            ),
          ],
        ),
      ),
    );
    ;
  }
}
