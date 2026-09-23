import 'package:flutter/material.dart';
// import 'package:library_management/service/library_management.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {

//   final LibraryManagement lm;
  const HomeScreen({super.key});

  final Color primaryColor = const Color(0xFFF5B84B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person_outline),
                    ),
                    const SizedBox(width: 12),

                    Text(
                        "Welcome to admin dashboad",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                        ),
                    ),
                    Icon(
                        Icons.notifications_none,
                        size: 28,
                    ),
                ]
            ),
            
        ),
        body: Column(
            children: [
                Container(
                    height: 48,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(50),
                    ),

                    child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    ),
                ),

                Row(
                  children: [
                      Expanded(
                          child: SummaryCard(
                              label: 'Return Today',
                              value :'15',
                          )
                      ),
                      Expanded(
                          child: SummaryCard(
                              label: 'Return Today',
                              value :'15',
                          )
                      ),
                  ],
                ),

                // Row(
                //   children: [
                //       Expanded(child: SummaryCard(label: 'Return Today',value :'15')),
                //       Expanded(child: SummaryCard(label: 'Return Today',value :'15')),
                //   ],
                // ),

                SizedBox(
                  height:
                      120, // A horizontal ListView requires a parent height constraint
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SummaryCard(label: 'Return Today', value: '15'),
                      SummaryCard(label: 'Pending Pickup', value: '8'),
                      SummaryCard(label: 'Overdue Returns', value: '3'),
                    ],
                  ),
                )
            ],   
        ),


        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black87,

          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(   
              icon: Icon(Icons.menu_book_outlined),
              label: "Books", 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "Borrow",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
    );
  }
}


