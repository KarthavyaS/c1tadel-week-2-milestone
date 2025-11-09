import 'package:flutter/material.dart';
class DocumentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with documents per current folder/state
    final docs = [
      {'name': 'Passport.pdf'},
      {'name': 'Resume.docx'},
    ];
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.3,
      children: docs.map((doc) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.description, size: 40),
            Text(doc['name'] ?? ''),
            IconButton(
              icon: Icon(Icons.lock),
              onPressed: () {},
            )
          ],
        ),
      )).toList(),
    );
  }
}
