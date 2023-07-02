import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import '../services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [];
  TransactionProvider({required context}) {
    fetchTransactions(context);
  }
  void createTransaction(Transaction transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  void fetchTransactions(context) async {
    transactions = await TransactionServices().fetchTransactions(context);
    notifyListeners();
  }
}
