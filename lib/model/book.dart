class Book {
  final int id;
  final String title;
  final String description;
  final String? authorName;
  final String coverImage;
  final int categoryId;

  Book({
    required this.id,
    required this.title,
    required this.description,
    this.authorName,
    required this.coverImage,
    required this.categoryId,

  });
}
