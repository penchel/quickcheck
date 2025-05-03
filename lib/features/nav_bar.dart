import 'package:flutter/material.dart';
import 'package:quickcheck/features/classroom/class_page.dart';   // redirecting
import 'package:quickcheck/features/profile/profile_page.dart';   // redirecting
import 'package:quickcheck/features/cam/cam_page.dart';   // redirecting

import 'package:quickcheck/app/theme_nav_bar.dart';   //

class NavBar extends StatefulWidget {
  final String userCpf;
  const NavBar({super.key, required this.userCpf});   // builder -- When creating, it is necessary to have a CPF
  @override
  State<NavBar> createState() => _NavBarState();
}


class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;   // control tab the user is
  List<Widget> _pages() => [
    ProfilePage(userCpf: widget.userCpf),   // profile page
    ClassPage(),    // classroom page
    CamPage(),    // cam page
  ];

  void _onItemTapped(int index) {
    setState(() {   // detects state change - automatically calls the build to refactor
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages()[_selectedIndex],   // which page is being displayed
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          bottomNavigationBarTheme: NavigationTheme.barTheme,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,   // makes the selected one visually different
          onTap: _onItemTapped,   // call to update the page
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.class_),
              label: 'Turmas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Câmera',
            ),
          ],
        ),
      ),
    );
  }
}
