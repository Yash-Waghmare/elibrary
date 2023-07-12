import 'package:flutter/material.dart';
import 'package:elibrary/models/book.dart';
import 'package:elibrary/services/book_services.dart';

// BookProvider is used to store the list of books in the app
// The functions are:
// 1. fetchBooks() - This function is used to fetch the list of books from the database
// 2. addBook() - This function is used to add a book to the list of books
// 3. updateBook() - This function is used to update a book in the list of books
// 4. getBook() - This function is used to get a book from the list of books
// 5. deleteBook() - This function is used to remove a book from the list of books
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

  void updateBook({required Book book}) {
    int indexOfBook;
    try {
      indexOfBook = books.indexOf(
          books.firstWhere((element) => element.bookCode == book.bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      books.removeAt(indexOfBook);
      books.add(book);
      notifyListeners();
    }
  }

  bool? getBook(String bookCode) {
    int indexOfBook;
    try {
      indexOfBook = books
          .indexOf(books.firstWhere((element) => element.bookCode == bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      return true;
    }
    return false;
  }

  void deleteBook({required context, required String bookCode}) {
    int indexOfBook;
    try {
      indexOfBook = books
          .indexOf(books.firstWhere((element) => element.bookCode == bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      books.removeAt(indexOfBook);
      notifyListeners();
    }
  }
}
