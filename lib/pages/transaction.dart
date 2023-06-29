import 'package:elibrary/widgets/transaction_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/hero_dialogue_route.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController transactionController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController bookIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomButton(
                  buttonText: 'Add Record',
                  buttonColor: AppColors.colors.green,
                  textColor: AppColors.colors.black,
                  function: () {
                    Navigator.of(context)
                        .push(HeroDialogRoute(builder: (context) {
                      return PopUpFrame(
                        height: MediaQuery.of(context).size.width * 0.34,
                        width: MediaQuery.of(context).size.width * 0.25,
                        title: 'Add Record',
                        buttonText: 'Add',
                        function: () {},
                        children: [
                          PopUpTextfield(
                              addRecordController: studentIdController,
                              hintText: 'Student ID'),
                          PopUpTextfield(
                              addRecordController: bookIdController,
                              hintText: 'Book ID'),
                        ],
                      );
                    }));
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomButton(
                  buttonText: 'Completed',
                  buttonColor: AppColors.colors.yellow,
                  textColor: AppColors.colors.black,
                  function: () {},
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomButton(
                  buttonText: 'Pending',
                  buttonColor: AppColors.colors.red,
                  textColor: AppColors.colors.black,
                  function: () {},
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomTextfield(
                    idController: transactionController,
                    hintText: 'Enter Transaction ID')
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Trasaction ID',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Student Name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Book Name',
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
                    'Status',
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
            TransactionTile(
                transactionId: 'E1234',
                studentName: 'Lomesh Rajendra Wagh',
                bookName: 'Shriman Yogi',
                status: false),
            TransactionTile(
                transactionId: 'E1235',
                studentName: 'Sarvesh Bapusaheb Chavan',
                bookName: 'Rich Dad Poor Dad',
                status: true),
            TransactionTile(
                transactionId: 'E1236',
                studentName: 'Yash Gulabrao Waghmare',
                bookName: 'A Potion For The Wise.',
                status: false)
          ],
        ),
      ),
    );
  }
}
