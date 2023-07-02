import 'package:elibrary/function/transaction_function.dart';
import 'package:elibrary/providers/transaction_provider.dart';
import 'package:elibrary/widgets/transaction_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: SingleChildScrollView(
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
                    controller: transactionController,
                    hintText: 'Enter Transaction ID',
                    onSubmit: (val) {},
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
              if (transactionProvider.transactions.length != 0)
                for (int i = 0;
                    i < transactionProvider.transactions.length;
                    i++)
                  TransactionTile(
                    transactionId:
                        transactionProvider.transactions[i].transactionId,
                    studentName:
                        transactionProvider.transactions[i].studentName,
                    bookName: transactionProvider.transactions[i].bookName,
                    status: transactionProvider.transactions[i].status ==
                        'returned',
                    onTap: () {
                      TransactionFunction().ShowTransaction(
                          context: context,
                          transactionId: transactionProvider
                              .transactions[i].transactionId!,
                          studentName:
                              transactionProvider.transactions[i].studentName!,
                          bookName:
                              transactionProvider.transactions[i].bookName!,
                          borrowedDate:
                              transactionProvider.transactions[i].borrowedDate!,
                          returnedDate: transactionProvider
                              .transactions[i].returnedDate!);
                    },
                    returnedFunc: () {},
                  ),
              transactionProvider.transactions.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
