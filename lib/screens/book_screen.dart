import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/function/book_functions.dart';
import 'package:elibrary/providers/book_provider.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:elibrary/widgets/custom_textfield.dart';
import 'package:elibrary/widgets/skeleton_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/book_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  TextEditingController codeController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();
  TextEditingController bookNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of<BookProvider>(context);
    return Container(
      color: AppColors.colors.background,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: IconButton(
              onPressed: () {
                setState(() {
                  bookProvider.fetchBooks(context);
                });
              },
              icon: Icon(
                Icons.refresh_outlined,
                size: 35,
                color: AppColors.colors.blue,
              )),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 20),
            child: Row(
              children: [
                CustomButton(
                  buttonText: 'Add Book',
                  buttonColor: AppColors.colors.green,
                  textColor: AppColors.colors.black,
                  function: () {
                    BookFunctions().addBook(
                      context: context,
                      bookAuthorController: bookAuthorController,
                      bookCodeController: codeController,
                      bookNameController: bookNameController,
                      descriptionController: descriptionController,
                      quantityController: quantityController,
                    );
                  },
                  fsize: 18,
                  height: 50,
                  fWeight: FontWeight.w600,
                  width: 190,
                ),
                CustomButton(
                  buttonText: 'Update Book',
                  buttonColor: AppColors.colors.yellow,
                  textColor: AppColors.colors.black,
                  function: () {},
                  fsize: 18,
                  height: 50,
                  fWeight: FontWeight.w600,
                  width: 190,
                ),
                CustomButton(
                  buttonText: 'Remove Book',
                  buttonColor: AppColors.colors.red,
                  textColor: AppColors.colors.black,
                  function: () {
                    BookFunctions().removeBook(
                        context: context,
                        bookCodeController: codeController,
                        adminPasswordController: adminPasswordController);
                  },
                  fsize: 18,
                  height: 50,
                  fWeight: FontWeight.w600,
                  width: 190,
                ),
                CustomTextfield(
                    controller: codeController,
                    hintText: 'Enter Book Code',
                    onSubmit: (val) {})
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          (bookProvider.isLoading == false)
              ? (bookProvider.books.isNotEmpty)
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.7,
                            ),
                            itemCount: bookProvider.books.length,
                            itemBuilder: (context, index) {
                              return BookCard(
                                bookName: bookProvider.books[index].bookName,
                                bookAuthor:
                                    bookProvider.books[index].bookAuthor,
                                description:
                                    bookProvider.books[index].description,
                                bookCode: bookProvider.books[index].bookCode,
                                bookImage: bookProvider.books[index].bookImage,
                                quantity: bookProvider.books[index].quantity,
                              );
                            }),
                      ),
                    )
                  : const Center(
                      child: Text(
                        'No Books Available',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
              : Expanded(
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.7,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, i) {
                        return SkeletonBox();
                      }),
                ))
        ]),
      ]),
    );
  }
}
