class BorrowRecord {
  final DateTime borrowDate;
  DateTime? returnDate;
  final int userId;
  final int bookId;

  BorrowRecord({required this.borrowDate, this.returnDate, required this.userId, required this.bookId});
}
