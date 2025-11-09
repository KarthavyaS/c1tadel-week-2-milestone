import 'package:flutter_c1tadel_documentvault/models/document.dart';
import 'package:flutter_c1tadel_documentvault/models/folder.dart';

class DBService {
  // Mock methods to fetch folders and documents
  static Future<List<Folder>> getFolders() async {
    return [Folder(id: '1', name: 'Personal', documentIds: ['a', 'b'])];
  }
  static Future<List<Document>> getDocuments(String folderId) async {
    return [Document(id: 'a', name: 'Passport.pdf', folderId: folderId)];
  }
}
