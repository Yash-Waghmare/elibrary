import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import '../providers/transaction_provider.dart';

class TransactionServices {
  Future<List<Transaction>> fetchTransactions(context) async {
    List<Transaction> transaction = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/transaction'), headers: <String, String>{
        'api_key': "123456",
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
        'authorization': 'bearer sarvesh@gmail.com'
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['transactions'];
            Transaction newTransaction;
            decode.forEach((map) => {
                  newTransaction = Transaction.fromJson(map),
                  transaction.add(newTransaction),
                });
          });
      return transaction;
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
    try {
      http.Response res = await http.put(
        Uri.parse(
            '$uri/transaction?transactionId=$transactionId&returnedDate=$returnedDate'),
        headers: <String, String>{
          'api_key': "123456",
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
          'authorization': 'bearer sarvesh@gmail.com',
        },
      );
      httpErrorHandle(response: res, context: context, onSuccess: () {});
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
    try {
      http.Response res = await http.post(
          Uri.parse(
              '$uri/transaction?bookCode=$bookCode&studentId=$studentId&borrowedDate=$borrowedDate'),
          headers: <String, String>{
            'api_key': "123456",
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
            'authorization': 'bearer sarvesh@gmail.com',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['transaction'];
            Transaction transaction = Transaction.fromJson(decode);
            Provider.of<TransactionProvider>(context, listen: false)
                .createTransaction(transaction);
          });
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
