
import 'package:flutter/material.dart';
import '../widgets/drop_down_category.dart';

class CreateBookScreen extends StatelessWidget {

  const CreateBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create new book'
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0 , vertical: 16.0),
        child: DropDownCategory(),
      ),
    );
  }
}