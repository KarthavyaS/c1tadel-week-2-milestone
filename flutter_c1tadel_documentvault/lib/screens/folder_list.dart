import 'package:flutter/material.dart';
class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your folders (ideally from Provider/app state)
    final folders = [
      {'name': 'Personal', 'locked': false},
      {'name': 'Work', 'locked': true},
      {'name': 'Travel', 'locked': false},
    ];
    return ListView.builder(
      itemCount: folders.length,
      itemBuilder: (context, idx) {
        var folder = folders[idx];
        return ListTile(
          leading: Icon((folder['locked'] as bool) ? Icons.lock : Icons.folder),
          title: Text(folder['name'] as String),
          onTap: () {}, // Load folder documents
        );
      },
    );
  }
}
