import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import '../services/transaction_services.dart';

// TransactionProvider is used to store the list of transactions in the app
// The functions are:
// 1. fetchTransactions() - This function is used to fetch the list of transactions from the database
// 2. createTransaction() - This function is used to add a transaction to the list of transactions
// 3. getTransaction() - This function is used to get a transaction with the help of unique
//                       transaction number from the list of transactions.
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
