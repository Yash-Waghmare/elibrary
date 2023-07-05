import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import '../services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [];
  List<Transaction> Pending = [];
  List<Transaction> Completed = [];
  TransactionProvider({required context}) {
    fetchTransactions(context);
  }
  void createTransaction(Transaction transaction) {
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
}
