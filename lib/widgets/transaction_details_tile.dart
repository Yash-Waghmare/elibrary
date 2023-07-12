import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// This file contains the transaction details tile widget
// TransactionTile is used to display the transaction details on the transaction_screen.dart
// The widget is used as follow:

// Widget Caller
// TransactionTile(
// transactionId: "2",
// studentName: "Yash Waghmare",
// bookName: "Shriman Yogi",
// date: "12/12/2023",
// status: false,
// ),
class TransactionTile extends StatelessWidget {
  const TransactionTile(
      {super.key,
      required this.transactionId,
      required this.studentName,
      required this.bookName,
      required this.status,
      required this.onTap,
      required this.returnedFunc});

  final dynamic transactionId, studentName, bookName, status;
  final void Function() onTap, returnedFunc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.625,
        height: MediaQuery.of(context).size.width * 0.038,
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
                transactionId,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                studentName,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                bookName,
                textAlign: TextAlign.center,
                style: appTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.colors.white),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomButton(
                height: MediaQuery.of(context).size.width * 0.025,
                width: MediaQuery.of(context).size.width * 0.065,
                buttonText: status ? "Returned" : "Return",
                buttonColor:
                    status ? AppColors.colors.green : AppColors.colors.red,
                function: status ? () {} : returnedFunc,
                textColor: AppColors.colors.black,
                fsize: 18,
                fWeight: FontWeight.w600,
                needCursor: status ? false : true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
