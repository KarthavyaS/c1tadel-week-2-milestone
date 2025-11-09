class Folder {
  final String id;
  final String name;
  final bool locked;
  final List<String> documentIds;
  Folder({required this.id, required this.name, this.locked = false, required this.documentIds});
}
