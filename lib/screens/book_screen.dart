import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/function/book_functions.dart';
import 'package:elibrary/providers/book_provider.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:elibrary/widgets/custom_textfield.dart';
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

  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of<BookProvider>(context);
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CustomButton(
                buttonText: 'Add Book',
                buttonColor: AppColors.colors.green,
                textColor: AppColors.colors.black,
                function: () {},
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
          const SizedBox(
            height: 30,
          ),
          (bookProvider.isLoading == false)
              ? (bookProvider.books.isNotEmpty)
                  ? Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: bookProvider.books.length,
                          itemBuilder: (context, index) {
                            return BookCard(
                              bookName: bookProvider.books[index].bookName,
                              bookAuthor: bookProvider.books[index].bookAuthor,
                              description:
                                  bookProvider.books[index].description,
                              bookCode: bookProvider.books[index].bookCode,
                              bookImage: bookProvider.books[index].bookImage,
                              quantity: bookProvider.books[index].quantity,
                            );
                          }),
                    )
                  : const Center(
                      child: Text('No Books Available'),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                )
        ]),
      ),
    );
  }
}
