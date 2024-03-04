import 'package:flutter/material.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_home.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_search.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_profile.dart';
import 'package:vintuff_thrift/views/dashboard/cart_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CartView(),
    const DashboardSearch(),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue, // Change the background color
        fixedColor: const Color.fromARGB(
            255, 224, 147, 147), // Change the selected item color
        unselectedItemColor: Colors.grey, // Change the unselected item color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
