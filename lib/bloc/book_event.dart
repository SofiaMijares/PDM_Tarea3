part of 'book_bloc.dart';

@immutable
abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<dynamic> get props => [];
}

class SearchEvent extends BookEvent {
  final String bookTitleSearch;

  const SearchEvent({required this.bookTitleSearch});
  @override
  List<dynamic> get props => [bookTitleSearch];
}