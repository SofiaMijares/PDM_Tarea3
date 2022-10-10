import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:tarea3/book_repository.dart';
import 'package:bloc/bloc.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookState get initialState => BookInitialState();

  final BookRepository bookRepository = BookRepository();
  BookBloc() : super(BookInitialState()) {
    on<SearchEvent>(_searchBook);
  }

  Future<dynamic> _searchBook(event, emit) async {/////////
    emit(LoadingState());

    String requiredTitle = event.bookTitleSearch;
    dynamic bookList;
    try {
      bookList = await bookRepository.getBooks(requiredTitle);

      if (bookList["items"] == null) {
        throw Exception();
      }

      emit(SuccessState(books: bookList["items"]));

    } catch (error) {
      emit(ErrorState(
          errorMessage: "Error"));
    }
  }
}