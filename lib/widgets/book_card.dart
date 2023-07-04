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
    required this.authorName,
    required this.description,
    required this.bookId,
    required this.imageUrl,
    // required this.bookQuantity,
  });

  final String bookName;
  final String authorName;
  final String description;
  final String bookId;
  final String imageUrl;
  // final String bookQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff313234),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              fit: BoxFit.fill,
              width: 110,
              height: 165,
              image: NetworkImage(imageUrl),
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
                      authorName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      bookId,
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
    );
  }
}
