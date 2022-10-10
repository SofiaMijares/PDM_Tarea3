part of 'book_bloc.dart';
@immutable
abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitialState extends BookState {}

class LoadingState extends BookState {}

class ErrorState extends BookState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class SuccessState extends BookState {
  final List<dynamic> books;

  const SuccessState({required this.books});

  @override
  List<Object?> get props => [books];
}