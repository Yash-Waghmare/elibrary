import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import '../services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> transactions = [];
  TransactionProvider({required context}) {
    fetchTransactions(context);
  }
  void createTransaction(TransactionModel transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  void fetchTransactions(context) async {
    transactions = await TransactionServices().fetchTransactions(context);
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
