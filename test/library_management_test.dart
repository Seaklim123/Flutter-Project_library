import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/service/library_management.dart';

void main() {
  group('Library Management Business Rules', () {
    late LibraryManagement library;

    setUp(() {
      library = LibraryManagement();

      // Initial data
      library.createCategory(id: 1, titile: 'Programming');
      library.createUser(id: 1, name: 'Seaklim');
      library.createUser(id: 2, name: 'Dara');
      library.createBook(id: 1, title: 'Dart Programming', categoryId: 1);
    });

    test('1. Create category successfully', () {
      expect(
        () => library.createCategory(id: 2, titile: 'Database'),
        returnsNormally,
      );
    });

    test('2. Cannot create category with duplicate ID', () {
      expect(
        () => library.createCategory(id: 1, titile: 'Java'),
        throwsException,
      );
    });

    test('3. Create user successfully', () {
      expect(() => library.createUser(id: 3, name: 'Vannak'), returnsNormally);
    });

    test('4. Cannot create user with duplicate ID', () {
      expect(
        () => library.createUser(id: 1, name: 'Another User'),
        throwsException,
      );
    });

    test('5. Create book successfully', () {
      expect(
        () => library.createBook(
          id: 2,
          title: 'Flutter Programming',
          categoryId: 1,
        ),
        returnsNormally,
      );
    });

    test('6. Cannot create book with duplicate ID', () {
      expect(
        () => library.createBook(id: 1, title: 'Another Book', categoryId: 1),
        throwsException,
      );
    });

    test('7. Cannot create book with non-existing category', () {
      expect(
        () => library.createBook(
          id: 2,
          title: 'Unknown Category Book',
          categoryId: 999,
        ),
        throwsException,
      );
    });

    test('8. User can borrow available book', () {
      expect(() => library.borrowBook(userId: 1, bookId: 1), returnsNormally);
    });

    test('9. Cannot borrow the same book twice', () {
      library.borrowBook(userId: 1, bookId: 1);

      expect(() => library.borrowBook(userId: 2, bookId: 1), throwsException);
    });

    test('10. Cannot borrow with non-existing user', () {
      expect(() => library.borrowBook(userId: 999, bookId: 1), throwsException);
    });

    test('11. Cannot borrow non-existing book', () {
      expect(() => library.borrowBook(userId: 1, bookId: 999), throwsException);
    });

    test('12. User can return borrowed book', () {
      library.borrowBook(userId: 1, bookId: 1);

      expect(() => library.returnBook(userId: 1, bookId: 1), returnsNormally);
    });

    test('13. Cannot return a book that was not borrowed', () {
      expect(() => library.returnBook(userId: 1, bookId: 1), throwsException);
    });

    test('14. Cannot return book by wrong user', () {
      library.borrowBook(userId: 1, bookId: 1);

      expect(() => library.returnBook(userId: 2, bookId: 1), throwsException);
    });
  });
}
