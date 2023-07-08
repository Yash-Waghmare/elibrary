import 'package:elibrary/constant/handler.dart';
import 'package:elibrary/services/book_image_service.dart';
import 'package:elibrary/services/book_services.dart';
import 'package:elibrary/widgets/hero_dialogue_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elibrary/constant/colors.dart';
import '../constant/theme.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class BookFunctions {
  String fileImage = '';
  late Uint8List image;
  Future<Uint8List> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    try {
      fileImage = result!.files.first.name!;
      image = result.files.first.bytes!;
    } on PlatformException catch (e) {
      print('Failed to pickimage : $e');
    }
    return image;
  }

  addBook(
      {required context,
      required TextEditingController bookNameController,
      required TextEditingController bookAuthorController,
      required TextEditingController bookCodeController,
      required TextEditingController descriptionController,
      required TextEditingController quantityController}) {
    Uint8List? img;
    Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return PopUpFrame(
          width: 950,
          title: 'Add Book',
          w1: 550,
          buttonText: 'Add',
          function: () async {
            String url = await uploadFile(img!, bookCodeController.text);
            int quantity = int.parse(quantityController.text);
            bool result = url == ' ' && quantity > 0 && quantity < 1000
                ? false
                : await BooksServices().addBook(
                    context: context,
                    bookCode: bookCodeController.text,
                    bookName: bookNameController.text,
                    bookAuthor: bookAuthorController.text,
                    bookImage: url,
                    description: descriptionController.text,
                    quantity: quantityController.text);
            print(quantity);
            bookAuthorController.clear();
            bookNameController.clear();
            bookAuthorController.clear();
            descriptionController.clear();
            bookCodeController.clear();
            if (result == true) {
              // ignore: use_build_context_synchronously
              showSnackBar(context, 'Book Added Successfully', false);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          },
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color(0xff595959),
                      borderRadius: BorderRadius.circular(20)),
                  child: img != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.memory(
                            img!,
                            fit: BoxFit.cover,
                            height: 400,
                            width: 250,
                          ),
                        )
                      : Center(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: AppColors.colors.white,
                            iconSize: 70,
                            onPressed: () async {
                              img = await pickImage();
                              (context as Element).markNeedsBuild();
                            },
                          ),
                        ),
                ),
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(left: 50),
                  width: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopUpTextfield(
                          controller: bookNameController,
                          hintText: 'Book Name'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Description',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                          maxLines: 3,
                          controller: descriptionController,
                          cursorColor: AppColors.colors.white,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: appTheme().textTheme.bodySmall,
                            filled: true,
                            fillColor: const Color(0xff595959),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 0, style: BorderStyle.none)),
                          )),
                      PopUpTextfield(
                          controller: bookAuthorController,
                          hintText: 'Book Author'),
                      PopUpTextfield(
                          controller: bookCodeController,
                          hintText: 'Book Code'),
                      PopUpTextfield(
                          controller: quantityController, hintText: 'Quantity')
                    ],
                  ),
                ),
              ],
            )
          ]);
    }));
  }

  removeBook(
      {required BuildContext context,
      required TextEditingController bookCodeController,
      required TextEditingController adminPasswordController}) {
    Navigator.of(context).push(HeroDialogRoute(builder: ((context) {
      return PopUpFrame(
        width: 400,
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
}
