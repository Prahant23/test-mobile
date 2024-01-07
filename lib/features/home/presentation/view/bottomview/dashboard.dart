// DashBoardViewss

import 'package:flutter/material.dart';

import 'about_view.dart';
import 'cart_view.dart';
import 'home_view.dart';
import 'profile_view.dart';

class DashBoardViewss extends StatefulWidget {
  const DashBoardViewss({Key? key}) : super(key: key);

  @override
  State<DashBoardViewss> createState() => _DashBoardViewssState();
}

class _DashBoardViewssState extends State<DashBoardViewss> {
  int _selectedIndex = 0;
  List<Widget> lstBottomView = <Widget>[
    HomeView(),
    const AboutView(),
    const ProfileView(),
    const CartView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vintuff'),
      ),
      body: lstBottomView.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
        ],
        backgroundColor: const Color.fromARGB(255, 203, 200, 188),
        selectedItemColor: const Color.fromARGB(255, 57, 180, 19),
        unselectedItemColor: Colors.black,
        onTap: (int index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  final String label;

  const SectionButton({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle section selection
      },
      child: Text(label),
    );
  }
}
