import 'package:flutter/material.dart';
import 'package:library_management/mock_data/book.dart';
import 'package:library_management/mock_data/category.dart';
import 'package:library_management/them/mian_color.dart';
import 'package:library_management/ui/screens/create_book_screen.dart';
import 'package:library_management/ui/widgets/book_list.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Books List',
          style: TextStyle(
            fontSize: 20
          ),
        ),  
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () async {
                final newBook = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateBookScreen(),
                  ),
                );

                if (newBook != null) {
                  setState(() {
                    books.add(newBook);
                  });
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 48,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(50),
              ),

              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Expanded(child: BookList(books: books, categories: categories)),
           
          ],
        ),
      ),
    );
  }
}
