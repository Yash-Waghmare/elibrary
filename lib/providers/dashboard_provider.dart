import 'package:elibrary/services/dashboard_services.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import '../services/transaction_services.dart';

class DashboardProvider with ChangeNotifier {
  Map<String, dynamic> m = {};
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
    notifyListeners();
  }
}
