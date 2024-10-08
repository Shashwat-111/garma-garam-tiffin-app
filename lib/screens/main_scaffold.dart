import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/screens/cart_page.dart';
import 'package:garma_garam_tiffin_app/screens/profile_page.dart';
import 'home_page.dart';
import 'my_orders_page.dart';


class HomeScreen extends StatefulWidget {
  final int currentIndex;
  const HomeScreen({super.key, required this.currentIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  //the state of the page is currently not preserved
  //todo either replace BottomNavBar with IndexedStack widget or wrap it with PageView widget
  _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  List<Widget> pages = const [
    HomePage(),
    CartPage(),
    MyOrdersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2),
            ]
        ),
        child: ClipRRect(
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            enableFeedback: false,
            iconSize: 26,
            selectedIconTheme : const IconThemeData(color: Colors.black),
            unselectedIconTheme: IconThemeData(color: Colors.grey[350]),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "Orders"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp), label: "Profile")
            ],
          ),
        ),
      ),

      body: pages[_selectedIndex],
    );
  }
}


