import 'package:elibrary/models/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:elibrary/providers/book_provider.dart';

class BooksServices {
  Future<List<Book>> fetchBooks(context) async {
    List<Book> books = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/book'), headers: <String, String>{
        'api_key': "123456",
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
        'authorization': 'bearer sarvesh@gmail.com'
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['books'];
            Book newBook;
            decode.forEach((map) => {
                  newBook = Book.fromJson(map),
                  books.add(newBook),
                });
          });
      // log(books.length.toString());
      return books;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<bool> removeBook(
      {required context,
      required String bookCode,
      required String adminPassword}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/book?bookCode=$bookCode&password=$adminPassword'),
        headers: <String, String>{
          'api_key': "123456",
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
          'authorization': 'bearer sarvesh@gmail.com',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Provider.of<BookProvider>(context, listen: false)
                .deleteBook(context: context, bookCode: bookCode);
          });
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
