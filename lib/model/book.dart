class Book {
  final int id;
  final String title;
  String? authorName;
  final int categoryId;
  bool isBorrowed;

  Book({
    required this.id,
    required this.title,
    this.authorName,
    required this.categoryId,
    this.isBorrowed = false,
  });
}
