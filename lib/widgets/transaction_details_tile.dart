import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:flutter/material.dart';


// Widget Caller
// TransactionTile(
// transactionId: "2",
// studentName: "Yash Waghmare",
// bookName: "Shriman Yogi",
// date: "12/12/2023",
// status: false,
// ),
class TransactionTile extends StatelessWidget {
  TransactionTile(
      {required this.transactionId,
        required this.studentName,
        required this.bookName,
        required this.status,
      required this.date});

  final transactionId, studentName, bookName, status,date;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.625,
      height: MediaQuery.sizeOf(context).width * 0.045,
      decoration: BoxDecoration(
          color: AppColors.colors.tileBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
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
              overflow: TextOverflow.ellipsis,
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
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: appTheme()
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomButton(
            height: MediaQuery.sizeOf(context).width*0.025,
            width: MediaQuery.sizeOf(context).width*0.085,
            buttonText: status?"Returned":"Return",
            buttonColor: status?AppColors.colors.green:AppColors.colors.red,
            function: status?(){}:(){
              // Add function to return the book
            },
          )
        ],
      ),
    );
  }
}
