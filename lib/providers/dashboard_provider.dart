import 'package:elibrary/services/dashboard_services.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';

// DashboardProvider is used to store the data of the dashboard in the app
// The function is:
// 1. fetchTransactions() - This function is used to fetch the list of transactions from the database

class DashboardProvider with ChangeNotifier {
  Map<String, dynamic> m = {};
  bool isLoading = true;
  List<TransactionModel> transactions = [];
  DashboardProvider({required context}) {
    fetchTransactions(context);
  }
  void fetchTransactions(context) async {
    m = await DashboardServices().fetchData(context);

    final recentTransaction = m['transactions'];
    for (int i = 0; i < recentTransaction.length; i++) {
      TransactionModel transaction =
          TransactionModel.fromJson(recentTransaction[i]);
      transactions.add(transaction);
    }
    isLoading = false;
    notifyListeners();
  }
}
