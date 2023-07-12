import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import '../providers/transaction_provider.dart';

class TransactionServices {
  Future<List<TransactionModel>> fetchTransactions(context) async {
    List<TransactionModel> transaction = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';
    try {
      http.Response res = await http.get(Uri.parse('$uri/transaction'),
          headers: <String, String>{
            'api_key': "123456",
            'token': token,
            'authorization': 'bearer $adminEmail'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['transactions'];
            TransactionModel newTransaction;
            decode.forEach((map) => {
                  newTransaction = TransactionModel.fromJson(map),
                  transaction.add(newTransaction),
                });
          });
      if (res.statusCode == 200) {
        return transaction;
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<bool> updateTransaction({
    required BuildContext context,
    required String transactionId,
    required String returnedDate,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';

    try {
      http.Response res = await http.put(
        Uri.parse(
            '$uri/transaction?transactionId=$transactionId&returnedDate=$returnedDate'),
        headers: <String, String>{
          'api_key': "123456",
          'token': token,
          'authorization': 'bearer $adminEmail',
        },
      );
      if (context.mounted) {
        httpErrorHandle(response: res, context: context, onSuccess: () {});
      }

      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> addTransaction({
    required BuildContext context,
    required String studentId,
    required String bookCode,
    required String borrowedDate,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';

    try {
      http.Response res = await http.post(
          Uri.parse(
              '$uri/transaction?bookCode=$bookCode&studentId=$studentId&borrowedDate=$borrowedDate'),
          headers: <String, String>{
            'api_key': "123456",
            'token': token,
            'authorization': 'bearer $adminEmail',
          });
      if (context.mounted) {
        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () {
              var decode = jsonDecode(res.body)['transaction'];
              TransactionModel transaction = TransactionModel.fromJson(decode);
              Provider.of<TransactionProvider>(context, listen: false)
                  .createTransaction(transaction);
            });
      }

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
