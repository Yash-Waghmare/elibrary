import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:elibrary/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../widgets/book_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
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
                function: () {},
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
          Table(
            children: [
              TableRow(children: [
                for (int i = 0; i < 3; i++)
                  const BookCard(
                    bookName: 'The Alchemist',
                    authorName: 'Paulo Coelho',
                    description:
                        'The Alchemist is a novel by Brazilian author Paulo Coelho that was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller. An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding a treasure there.',
                    bookId: '123456789',
                    imageUrl: 'https://rb.gy/ks25p',
                    // bookQuantity: '10',
                  ),
              ])
            ],
          )
        ]),
      ),
    );
  }
}
