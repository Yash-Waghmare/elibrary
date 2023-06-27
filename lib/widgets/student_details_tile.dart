import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/widgets/popup_window.dart';
import 'package:flutter/material.dart';

// Widget Caller
// StudentDetailsTile(
// studentId: "1",
// studentName: "Yash Waghmare",
// contactNumber: "1234567890",
// emailId: "yash.waghmare20@pccoepune.org",
// ),

class StudentDetailsTile extends StatelessWidget {
  StudentDetailsTile(
      {required this.studentId,
      required this.studentName,
      required this.contactNumber,
      required this.emailId});

  final studentId, studentName, contactNumber, emailId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Write a navigator route to pup up the student details
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.625,
        height: MediaQuery.of(context).size.width * 0.045,
        decoration: BoxDecoration(
            color: AppColors.colors.tileBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                studentId,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                studentName,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                contactNumber,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                emailId,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
