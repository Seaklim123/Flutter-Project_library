import 'package:flutter/material.dart';
import 'package:library_management/model/book.dart';
import 'package:library_management/model/category.dart';

class BookList extends StatefulWidget {
  const BookList({super.key, required this.books, required this.categories});

  final List<Book> books;
  final List<Category> categories;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.books.length,
      itemBuilder: (_, index) {
        final book = widget.books[index];

        final category = widget.categories.firstWhere(
          (category) => category.id == book.categoryId,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade200,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    book.coverImage,
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category: ${category.title}'),
                    Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(book.description),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
