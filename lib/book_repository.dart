import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookRepository {
  static final BookRepository bookRepository = BookRepository._internal();
  factory BookRepository() => bookRepository;

  BookRepository._internal();

  Future<dynamic> getBooks(String requiredTitle) async {
    dynamic bookList;
    final api = Uri(
        scheme: "https",
        host: "www.googleapis.com",
        path: "books/v1/volumes",
        queryParameters: {"q": requiredTitle});
    try {
      dynamic response = await http.get(api);
      bookList = jsonDecode(response.body);
      return bookList;
    } catch (error) {
      throw "Error";
    }
  }
}