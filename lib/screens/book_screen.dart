import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/function/book_functions.dart';
import 'package:elibrary/providers/book_provider.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:elibrary/widgets/custom_textfield.dart';
import 'package:elibrary/widgets/skeleton_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/handler.dart';
import '../widgets/book_card.dart';

// BookScreen is used to display the list of books in the app
// Book Screen contains the functionality of:
// 1. Adding a book
// 2. Updating a book
// 3. Deleting a book
// 4. Searching a book
// 5. Refreshing the list of books
// 6. Displaying the list of books

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
  void initState() {
    super.initState();
  }

  String showList = '';

  @override
  Widget build(BuildContext context) {
    BookProvider bookProvider = Provider.of<BookProvider>(context);
    final filterBook = bookProvider.books
        .where((element) => element.bookCode == showList || showList.isEmpty)
        .toList();
    return Container(
      color: AppColors.colors.background,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: IconButton(
              onPressed: () {
                setState(() {
                  showList = '';
                  bookProvider.books = [];
                  bookProvider.isLoading = true;
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
                  function: () {
                    BookFunctions().updateBook(
                        context: context, bookCodeController: codeController);
                  },
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
                    onSubmit: (val) {
                      setState(() {
                        if (val.isNotEmpty) {
                          bool? valid = bookProvider.getBook(val);
                          if (valid!) {
                            showList = val;
                          } else {
                            showList = '';
                            showSnackBar(context, 'Book Not Found', true);
                            codeController.clear();
                          }
                        } else {
                          showList = '';
                        }
                      });
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          (bookProvider.isLoading == false)
              ? (filterBook.isNotEmpty)
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.7,
                            ),
                            itemCount: filterBook.length,
                            itemBuilder: (context, index) {
                              return BookCard(
                                bookName: filterBook[index].bookName!,
                                bookAuthor: filterBook[index].bookAuthor!,
                                description: filterBook[index].description!,
                                bookCode: filterBook[index].bookCode!,
                                bookImage: filterBook[index].bookImage!,
                                quantity: filterBook[index].quantity!,
                                onTap: () {
                                  BookFunctions().showBook(
                                      context: context,
                                      bookName: filterBook[index].bookName!,
                                      authorName: filterBook[index].bookAuthor!,
                                      description:
                                          filterBook[index].description!,
                                      bookCode: filterBook[index].bookCode!,
                                      quantity: filterBook[index].quantity!,
                                      bookImage: filterBook[index].bookImage!);
                                },
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.7,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, i) {
                        return const SkeletonBox();
                      }),
                ))
        ]),
      ]),
    );
  }
}
