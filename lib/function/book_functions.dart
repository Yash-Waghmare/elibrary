import 'package:elibrary/constant/handler.dart';
import 'package:elibrary/services/book_services.dart';
import 'package:elibrary/widgets/hero_dialogue_route.dart';
import 'package:flutter/material.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class BookFunctions {
  removeBook(
      {required BuildContext context,
      required TextEditingController bookCodeController,
      required TextEditingController adminPasswordController}) {
    Navigator.of(context).push(HeroDialogRoute(builder: ((context) {
      return PopUpFrame(
        height: MediaQuery.of(context).size.width * 0.34,
        width: MediaQuery.of(context).size.width * 0.25,
        title: 'Remove Book',
        buttonText: 'Remove',
        function: () async {
          bool result = await BooksServices().removeBook(
            context: context,
            bookCode: bookCodeController.text,
            adminPassword: adminPasswordController.text,
          );
          bookCodeController.clear();
          adminPasswordController.clear();
          if (result == true) {
            showSnackBar(context, 'Book Removed Successfully', false);
            Navigator.pop(context);
          }
        },
        children: [
          const SizedBox(
            height: 10,
          ),
          PopUpTextfield(
            controller: bookCodeController,
            hintText: 'BookCode',
          ),
          const SizedBox(
            height: 10,
          ),
          PopUpTextfield(
            controller: adminPasswordController,
            hintText: 'Admin Password',
          ),
        ],
      );
    })));
  }

  shomBook() {}
}
