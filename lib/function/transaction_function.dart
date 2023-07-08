import 'package:flutter/cupertino.dart';

import '../widgets/hero_dialogue_route.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class TransactionFunction {
  ShowTransaction(
          {required BuildContext context,
          required String transactionId,
          required String studentName,
          required String bookName,
          required String borrowedDate,
          required String returnedDate}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            width: MediaQuery.of(context).size.width * 0.30,
            title: 'Transaction Details',
            isButtonNeeded: false,
            buttonText: 'Cancel',
            function: () {
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Transacation ID :   $transactionId',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Student :   $studentName',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Book :      $bookName',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Borrowed Date :   $borrowedDate',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Returned Date :   $returnedDate',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }))
      };
}
