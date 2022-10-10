import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:tarea3/bloc/book_bloc.dart';
import 'package:tarea3/screens/details_page.dart';
import 'package:tarea3/screens/book_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Libreria Free to Play'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.grey[600],
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Ingresa titulo",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    BlocProvider.of<BookBloc>(context).add(
                        SearchEvent(bookTitleSearch: titleController.text));
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            Expanded(
              child:
                  BlocBuilder<BookBloc, BookState>(builder: (context, state) {
                if (state is LoadingState) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const VideoShimmer();
                    },
                  );
                } else if (state is ErrorState) {
                  return const Center(
                      child: Text("No se encontró"));
                } else if (state is SuccessState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.books.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BookGrid(book: state.books[index]);
                        }),
                  );
                } else {
                  return const Center(
                    child: Text("Ingrese palabra para buscar libro"),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}