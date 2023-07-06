import 'dart:js_util';

import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  int index = 0;
  HomePageProvider({required index}) {
    this.index = index;
  }

  void setIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
