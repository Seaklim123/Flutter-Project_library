import 'package:flutter/material.dart';
import 'package:library_management/mock_data/book.dart';
import 'package:library_management/ui/screens/book_screen.dart';
import 'package:library_management/ui/screens/main_custom_app_screen.dart';
import 'package:library_management/ui/widgets/book_list.dart';
import 'package:library_management/ui/screens/create_book_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainCustomAppScreen(),
    );
  }
}
