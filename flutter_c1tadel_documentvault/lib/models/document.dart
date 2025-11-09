class Document {
  final String id;
  final String name;
  final String folderId;
  final bool locked;
  Document({required this.id, required this.name, required this.folderId, this.locked = false});
}
