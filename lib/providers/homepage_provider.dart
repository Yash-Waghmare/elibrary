import 'package:flutter/cupertino.dart';

// HomePageProvider is ude to set the index of the selected menu item
// The functions are:
// 1. setIndex() - This function is used to set the index of the selected menu item
// 2. remove() - This function is used to remove the index of the selected menu item
// The menu items are:
// 1. Dashboard
// 2. Students
// 3. Books
// 4. Transaction
// 5. Calculate Fine

class HomePageProvider with ChangeNotifier {
  int index = 0;
  HomePageProvider({required this.index});

  void setIndex(int index) {
    this.index = index;
    notifyListeners();
  }

  void remove() {
    index = 0;
    notifyListeners();
  }
}
