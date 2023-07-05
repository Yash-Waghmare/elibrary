import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import '../services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> transactions = [];
  List<TransactionModel> Pending = [];
  List<TransactionModel> Completed = [];
  TransactionProvider({required context}) {
    fetchTransactions(context);
  }
  void createTransaction(TransactionModel transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  void fetchTransactions(context) async {
    transactions = await TransactionServices().fetchTransactions(context);
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].status == 'return') {
        Pending.add(transactions[i]);
      } else {
        Completed.add(transactions[i]);
      }
    }
    notifyListeners();
  }

  bool? getTransaction(String transactionId) {
    int indexOfStudent;
    try {
      indexOfStudent = transactions.indexOf(transactions
          .firstWhere((element) => element.transactionId == transactionId));
    } catch (e) {
      indexOfStudent = -1;
    }
    if (indexOfStudent != -1) {
      return true;
    }
    return false;
  }
}
