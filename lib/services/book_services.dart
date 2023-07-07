import 'package:elibrary/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:elibrary/providers/book_provider.dart';

class BooksServices {
  Future<List<Book>> fetchBooks(context) async {
    List<Book> books = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =  prefs.getString('token')??'',adminEmail=prefs.getString('adminEmail')??'';

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/book'), headers: <String, String>{
        'api_key': "123456",
        'token':
            token,
            'authorization': 'bearer $adminEmail'
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =  prefs.getString('token')??'',adminEmail=prefs.getString('adminEmail')??'';

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/book?bookCode=$bookCode&password=$adminPassword'),
        headers: <String, String>{
          'api_key': "123456",
          'token':token,
          'authorization': 'bearer $adminEmail',
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
