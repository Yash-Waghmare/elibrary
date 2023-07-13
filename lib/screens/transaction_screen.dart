import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/function/transaction_function.dart';
import 'package:elibrary/providers/transaction_provider.dart';
import 'package:elibrary/widgets/skeleton_tile_transaction.dart';
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
import '../widgets/skeleton_tile_student.dart';

// TransactionScreen is used to display the list of transactions in the app
// Transaction Screen contains the functionality of:
// 1. Adding a record of transaction
// 2. Showing completed transaction
// 3. Showing pending transaction
// 4. Refreshing the list of transactions
// 5. Displaying the list of transactions
// 6. Searching a transaction

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  // date variable is use to add the date
  DateTime date = DateTime.now();
  // showList string is use to filter total list into the pending or completed list
  String showList = '';
  // controllers are used for textfield input
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController bookIdController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // transaction provider call is used to update the transactions only
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    // filterList variable is use to store the list
    final filterList = transactionProvider.transactions.where(
      (element) {
        return element.status == showList ||
            element.transactionId == showList ||
            showList.isEmpty;
      },
    ).toList();
    return Container(
      color: AppColors.colors.background,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            // Refresh icon is used to reload the transactions
            child: IconButton(
                onPressed: () {
                  setState(() {
                    showList = '';
                    transactionProvider.isLoding = true;
                    transactionProvider.transactions = [];
                    // fetching transasctions by calling provider functions
                    transactionProvider.fetchTransactions(context);
                    // Empty string gives total transactions
                    showList = '';
                    transactionIdController.clear();
                  });
                },
                icon: Icon(
                  Icons.refresh_outlined,
                  size: 35,
                  color: AppColors.colors.blue,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add record button is used to add the transactions
                    CustomButton(
                      buttonText: 'Add Record',
                      buttonColor: AppColors.colors.green,
                      textColor: AppColors.colors.black,
                      function: () {
                        setState(() {
                          showList = '';
                          transactionIdController.clear();
                        });
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return PopUpFrame(
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
                              if (context.mounted) Navigator.pop(context);
                            },
                            children: [
                              // Custom Textfields
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
                    // Completed Button filter out the transaction list into completed list
                    CustomButton(
                      buttonText: 'Completed',
                      buttonColor: AppColors.colors.yellow,
                      textColor: AppColors.colors.black,
                      function: () {
                        setState(() {
                          showList = 'returned';
                          transactionIdController.clear();
                        });
                      },
                      height: 50,
                      width: 190,
                      fsize: 18,
                      fWeight: FontWeight.w600,
                    ),
                    // Pending Button filter out the transation list into pending list
                    CustomButton(
                      buttonText: 'Pending',
                      buttonColor: AppColors.colors.red,
                      textColor: AppColors.colors.black,
                      function: () {
                        setState(() {
                          showList = 'return';
                          transactionIdController.clear();
                        });
                      },
                      height: 50,
                      width: 190,
                      fsize: 18,
                      fWeight: FontWeight.w600,
                    ),
                    // Textfield to search transactions
                    CustomTextfield(
                      controller: searchController,
                      hintText: 'Enter Transaction ID',
                      onSubmit: (val) {
                        setState(() {
                          if (val.isNotEmpty) {
                            //  valid variable is to check the transaction id exits or not
                            bool? valid =
                                transactionProvider.getTransaction(val);
                            if (valid!) {
                              showList = val;
                            } else {
                              showList = '';
                              showSnackBar(
                                  context, 'Transaction Id Not Found', true);
                              searchController.clear();
                            }
                          } else {
                            showList = '';
                          }
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: (transactionProvider.isLoding == true)
                        ? ListView.builder(
                            itemCount: 11,
                            itemBuilder: ((context, i) {
                              // if list is empty then it will show empty slots
                              return const SkeletonTileTransaction();
                            }),
                          )
                        : filterList.isEmpty
                            ? Center(
                                child: Text('No Transactions Available',
                                    style: appTheme()
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: AppColors.colors.white,
                                        )))
                            : ListView.builder(
                                itemCount: filterList.length,
                                itemBuilder: ((context, i) {
                                  return TransactionTile(
                                    transactionId: filterList[i].transactionId,
                                    studentName: filterList[i].studentName,
                                    bookName: filterList[i].bookName,
                                    status: filterList[i].status == 'returned',
                                    onTap: () {
                                      TransactionFunction().showTransaction(
                                          context: context,
                                          transactionId:
                                              filterList[i].transactionId!,
                                          studentName:
                                              filterList[i].studentName!,
                                          bookName: filterList[i].bookName!,
                                          borrowedDate:
                                              filterList[i].borrowedDate!,
                                          returnedDate:
                                              filterList[i].returnedDate!);
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
                                      if (context.mounted) {
                                        if (result == false) {
                                          // alert message
                                          showSnackBar(
                                              context,
                                              "Unable to update transaction",
                                              true);
                                        } else {
                                          transactionProvider
                                              .fetchTransactions(context);
                                          showSnackBar(
                                              // alert message
                                              context,
                                              'Transcation Updated',
                                              false);
                                          setState(() {});
                                        }
                                      }
                                    },
                                  );
                                }))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
