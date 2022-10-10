import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:tarea3/book_repository.dart';


class Details extends StatefulWidget {
  final dynamic book;
  const Details({super.key, this.book});

  @override
  State<Details> createState() => _SelectedBookState();
}

class _SelectedBookState extends State<Details> {
  bool title = false;
  bool description = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de libro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.public),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "${widget.book["volumeInfo"]["imageLinks"] != null ? widget.book["volumeInfo"]["imageLinks"]["thumbnail"] : "error"}",
                fit: BoxFit.fitHeight,
                height: 350,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15.0), 
                  child: Text(
                    "${widget.book["volumeInfo"]["title"] ?? "Title not available"}",
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  title = !title;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "${widget.book["volumeInfo"]["publishedDate"] ?? "Date not available"}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Paginas: ${widget.book["volumeInfo"]["pageCount"] ?? "Page number not available"}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              GestureDetector(
                child: Text(
                  "${widget.book["volumeInfo"]["description"] ?? "Description not available"}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.left,
                ),
                onTap: () {
                  description = !description;
                  setState(() {});
                },
              ),
            ],
          ),
      ),
    );
  }

}