import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';

/*
BookCard(
  bookName: 'The Alchemist',
  authorName: 'Paulo Coelho',
  description:
      'The Alchemist is a novel by Brazilian author Paulo Coelho that was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller. An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding a treasure there.',
  bookId: '123456789',
  imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51ZU%2BCvkTyL._SX331_BO1,204,203,200_.jpg',
  bookQuantity: '10',
  )
*/
class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.bookName,
    required this.bookAuthor,
    required this.description,
    required this.bookCode,
    required this.bookImage,
    required this.quantity,
  });

  final bookName;
  final bookAuthor;
  final description;
  final bookCode;
  final bookImage;
  final quantity;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 215,
        width: 400,
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
                  fit: BoxFit.fill,
                  width: 110,
                  height: 165,
                  image: NetworkImage(bookImage),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
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
                              fontSize: 16,
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
                            fontSize: 14,
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
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          bookCode,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
        top: 0,
        right: 0,
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 62, 64, 66),
            ),
            child: Center(
              child: Text(
                quantity,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    ]);
  }
}
