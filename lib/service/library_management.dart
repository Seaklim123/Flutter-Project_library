
import '../../model/book.dart';
import '../../model/borrow_record.dart';
import '../../model/category.dart';
// import '../model/librarian.dart';
import '../../model/user.dart';

class LibraryManagement {
  final List<Book> _books = [];
  final List<BorrowRecord> _borrowRecords = [];
  final List<Category> _categories = [];
  // final List<Librarian> librarian = [];
  final List<User> _users = [];

  void createCategory({required int id, required String titile}) {
    final cleanTitle = titile.trim();

    //Empty check
    if (cleanTitle.isEmpty) {
      throw Exception('Category titile cannot be empty');
    }

    //Check duplicate title
    final exists = _categories.any(
      (category) => category.titile.toLowerCase() == cleanTitle.toLowerCase(),
    );

    if (exists) {
      throw Exception('Category already exists');
    }

    final idExists = _categories.any((category) => category.id == id);

    if (idExists) {
      throw Exception('Category ID already exists');
    }

    _categories.add(Category(
      id: id,
      titile: cleanTitle));
  }

  void createUser({required int id, required String name}) {
    User? user = _findUserOrNull(id);
    if (user != null) {
      throw Exception('Student $user already exists');
    }

    _users.add(User(id: id, name: name));
  }

  void createBook({required int id, required String title, required int categoryId}) {
    if (id <= 0) {
      throw Exception('Book ID must be greater than 0');
    }

    if (title.trim().isEmpty) {
      throw Exception('Book title cannot be empty');
    }

    if (_books.any((book) => book.id == id)) {
      throw Exception('Book ID already exists');
    }

    if (!_categories.any((category) => category.id == categoryId)) {
      throw Exception('Category does not exist');
    }

    _books.add(
      Book(
        id: id,
        title: title.trim(),
        categoryId: categoryId,
      ),
    );
}
  

  void borrowBook({required int userId, required int bookId}) {
    final user = _users.where((user) => user.id == userId);

    if (user.isEmpty) {
      throw Exception('User does not exist');
    }

    final bookList = _books.where((book) => book.id == bookId);

    if (bookList.isEmpty) {
      throw Exception('Book does not exist');
    }

    final book = bookList.first;

    if (book.isBorrowed) {
      throw Exception('Book is already borrowed');
    }

    final activeBorrowCount = _borrowRecords.where(
      (record) =>
          record.userId == userId &&
          record.returnDate == null,
    ).length;

    if (activeBorrowCount >= 3) {
      throw Exception('User cannot borrow more than 3 books');
    }

    _borrowRecords.add(
      BorrowRecord(
        userId: userId,
        bookId: bookId,
        borrowDate: DateTime.now(),
      ),
    );

    book.isBorrowed = true;
  }


  void returnBook({required int userId, required int bookId}) {
    final records = _borrowRecords.where(
      (record) =>
          record.userId == userId &&
          record.bookId == bookId &&
          record.returnDate == null,
    );

    if (records.isEmpty) {
      throw Exception('This user did not borrow this book');
    }

    final record = records.first;

    final books = _books.where((book) => book.id == bookId);

    if (books.isEmpty) {
      throw Exception('Book does not exist');
    }

    final book = _books.first;

    record.returnDate = DateTime.now();

    book.isBorrowed = false;
  }

  User? _findUserOrNull(int id) {
    for (User u in _users) {
      if (u.id == id) {
        return u;
      }
    }
    return null; // not found
  }
  
}
