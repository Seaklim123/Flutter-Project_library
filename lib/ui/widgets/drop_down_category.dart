import 'package:flutter/material.dart';

class DropDownCategory extends StatelessWidget {
  const DropDownCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownMenu<String>(
            width: double.infinity,
            hintText: 'Select category...',
            requestFocusOnTap: true,
            enableSearch: true,
            leadingIcon: const Icon(Icons.category_outlined),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color.fromARGB(255, 250, 250, 250),
            ),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: '1', label: 'Development'),
              DropdownMenuEntry(value: '2', label: 'Design'),
              DropdownMenuEntry(value: '3', label: 'Marketing'),
            ],
          ),
          const SizedBox(height: 32),

          
        ],
      ),
    );
  }
}
