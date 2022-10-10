import 'package:flutter/material.dart';
import 'package:tarea3/screens/details_page.dart';


class BookGrid extends StatelessWidget {
  final dynamic book;
  const BookGrid({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Details(
                  book: book,
                ),
              ),
            );
          },
          child: Image.network(
            "${book["volumeInfo"]["imageLinks"] != null ? book["volumeInfo"]["imageLinks"]["thumbnail"] : "error"}",
            width: 150,
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "${book["volumeInfo"]["title"] ?? "error"}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}