
import 'package:flutter/material.dart';
import 'package:library_management/them/mian_color.dart';
import 'package:library_management/ui/screens/book_screen.dart';
import 'package:library_management/ui/screens/borrow_screen.dart';
import 'package:library_management/ui/screens/home_screen.dart';
import 'package:library_management/ui/screens/profile_screen.dart';

class MainCustomAppScreen extends StatefulWidget {
  const MainCustomAppScreen({super.key});

  @override
  State<MainCustomAppScreen> createState() => _MainCustomAppScreenState();
}

class _MainCustomAppScreenState extends State<MainCustomAppScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      HomeScreen(), 
      BookScreen(),
      BorrowScreen(),
      ProfileScreen()
      
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 28,
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        selectedLabelStyle: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),

        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1
                  ? Icons.menu_book_outlined
                  : Icons.menu_book_outlined,
            ),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2
                  ? Icons.assignment_outlined
                  : Icons.assignment_outlined,
            ),
            label: "Borrow",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 3 ? Icons.person_outline : Icons.person_outline,
            ),
            label: "Profile",
          ),
        ],
      ),

      body: page[selectedIndex],
    );
  }

  
}
