import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final Color primaryColor = const Color(0xFFF5B84B);

  final String label;
  final String value;

  const SummaryCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
   return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                color: primaryColor,
              ),

            ), 
            const SizedBox(height: 4), 
            Text(
              label,
              style: TextStyle(color: primaryColor),
            ),  
          ],
        ),
      ),
    );
  }
}


