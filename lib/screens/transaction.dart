import 'package:elibrary/function/transaction_function.dart';
import 'package:elibrary/home_page.dart';
import 'package:elibrary/providers/transaction_provider.dart';
import 'package:elibrary/screens/dashboard.dart';
import 'package:elibrary/widgets/transaction_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../constant/handler.dart';
import '../services/transaction_services.dart';
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
  DateTime date = DateTime.now();
  bool isCompletedScreen = false;
  bool isPendingScreen = false;
  String showList = '';
  String transactionId = '';
  TextEditingController transactionController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController bookIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    final filterList = transactionProvider.transactions.where(
      (element) {
        return element.status == showList ||
            element.transactionId == showList ||
            showList.isEmpty;
      },
    ).toList();
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
                    setState(() {
                      showList = '';
                    });
                    Navigator.of(context)
                        .push(HeroDialogRoute(builder: (context) {
                      return PopUpFrame(
                        height: MediaQuery.of(context).size.width * 0.34,
                        width: MediaQuery.of(context).size.width * 0.25,
                        title: 'Add Record',
                        buttonText: 'Add',
                        function: () async {
                          String confirmedDate =
                              DateFormat('dd/MM/yyyy').format(date);
                          await TransactionServices().addTransaction(
                              context: context,
                              studentId: studentIdController.text,
                              bookCode: bookIdController.text,
                              borrowedDate: confirmedDate);
                          studentIdController.clear();
                          bookIdController.clear();
                          Navigator.pop(context);
                        },
                        children: [
                          PopUpTextfield(
                              controller: studentIdController,
                              hintText: 'Student ID'),
                          PopUpTextfield(
                              controller: bookIdController,
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
                  function: () {
                    setState(() {
                      showList = 'returned';
                    });
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomButton(
                  buttonText: 'Pending',
                  buttonColor: AppColors.colors.red,
                  textColor: AppColors.colors.black,
                  function: () {
                    setState(() {
                      showList = 'return';
                    });
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomTextfield(
                  controller: transactionController,
                  hintText: 'Enter Transaction ID',
                  onSubmit: (val) {
                    setState(() {
                      showList = val;
                      print(showList);
                    });
                  },
                )
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
            Expanded(
                child: filterList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: filterList.length,
                        itemBuilder: ((context, i) {
                          return TransactionTile(
                            transactionId: filterList[i].transactionId,
                            studentName: filterList[i].studentName,
                            bookName: filterList[i].bookName,
                            status: filterList[i].status == 'returned',
                            onTap: () {
                              TransactionFunction().ShowTransaction(
                                  context: context,
                                  transactionId: filterList[i].transactionId!,
                                  studentName: filterList[i].studentName!,
                                  bookName: filterList[i].bookName!,
                                  borrowedDate: filterList[i].borrowedDate!,
                                  returnedDate: filterList[i].returnedDate!);
                            },
                            returnedFunc: () async {
                              String confirmedDate =
                                  DateFormat('dd/MM/yyyy').format(date);
                              bool result = await TransactionServices()
                                  .updateTransaction(
                                      context: context,
                                      transactionId:
                                          filterList[i].transactionId!,
                                      returnedDate: confirmedDate);
                              if (result == false) {
                                showSnackBar(context,
                                    "Unable to update transaction", true);
                              } else {
                                transactionProvider.fetchTransactions(context);
                                showSnackBar(
                                    context, 'Transcation Updated', false);
                                setState(() {});
                              }
                            },
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
