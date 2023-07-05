import 'package:flutter/material.dart';
import 'package:elibrary/models/book.dart';
import 'package:elibrary/services/book_services.dart';

class BookProvider with ChangeNotifier {
  bool isLoading = true;
  List<Book> books = [];
  BookProvider({required context}) {
    fetchBooks(context);
  }

  void fetchBooks(context) async {
    books = await BooksServices().fetchBooks(context);
    isLoading = false;
    notifyListeners();
  }

  void addBook({required Book book}) {
    books.add(book);
    notifyListeners();
  }
}
