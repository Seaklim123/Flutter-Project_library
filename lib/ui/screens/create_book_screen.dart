import 'package:flutter/material.dart';
import 'package:library_management/mock_data/book.dart';
import 'package:library_management/mock_data/category.dart';
import 'package:library_management/model/book.dart';
import 'package:library_management/ui/widgets/book_list.dart';

class CreateBookScreen extends StatefulWidget {
  const CreateBookScreen({super.key});

  @override
  State<CreateBookScreen> createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String? _authorName;
  String _coverImage = '';
  int? _categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Book')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    maxLength: 20,
                    decoration: const InputDecoration(labelText: 'Book title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter a title.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value!;
                    },
                  ),

                  TextFormField(
                    maxLength: 40,
                    decoration: const InputDecoration(
                      labelText: 'Book description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Enter a description at least 5 characters long.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),

                  DropdownButtonFormField<int>(
                    value: _categoryId,
                    decoration: const InputDecoration(labelText: 'Category'),
                    items:
                        categories.map((category) {
                          return DropdownMenuItem<int>(
                            value: category.id,
                            child: Text(category.title),
                          );
                        }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _categoryId = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  FilledButton(
                    onPressed: () {
                      if (_formGlobalKey.currentState!.validate()) {
                        _formGlobalKey.currentState!.save();

                        setState(() {
                          books.add(
                            Book(
                              id: books.length + 1,
                              title: _title,
                              description: _description,
                              authorName: _authorName,
                              coverImage: _coverImage,
                              categoryId: _categoryId!,
                            ),
                          );
                        });
                      }
                    },
                    child: const Text('Add Book'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
