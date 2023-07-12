import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';

// This file contains the book card widget
// This widget is used to display the book card
// This widget is used in:
// 1. Book Screen
// This widget is used as a follow:
/*
BookCard(
  bookName: 'The Alchemist',
  authorName: 'Paulo Coelho',
  description:
      'The Alchemist is a novel by Brazilian author Paulo Coelho that was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller. An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding a treasure there.',
  bookId: '123456789',
  imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51ZU%2BCvkTyL._SX331_BO1,204,203,200_.jpg',
  quantity: '10',
  )
*/
class BookCard extends StatelessWidget {
  const BookCard(
      {super.key,
      required this.bookName,
      required this.bookAuthor,
      required this.description,
      required this.bookCode,
      required this.bookImage,
      required this.quantity,
      required this.onTap});

  final String bookName;
  final String bookAuthor;
  final String description;
  final String bookCode;
  final String bookImage;
  final String quantity;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(children: [
        Container(
          height: 190,
          width: 410,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff313234),
          ),
          margin: const EdgeInsets.all(10),
          child: Stack(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.cover,
                    width: 100,
                    height: 155,
                    image: NetworkImage(bookImage),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              bookName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            description,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookAuthor,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            bookCode,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ]),
          ]),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.all(10),
              width: 50,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colors.buttonBackground,
              ),
              child: Center(
                child: Text(
                  quantity,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
