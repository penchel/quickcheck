import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quickcheck/presenca_page.dart';
import 'package:quickcheck/register_page.dart';
import 'package:quickcheck/turmas_page.dart';
import 'package:quickcheck/login_page.dart';
import 'package:quickcheck/camera_page.dart'; // <-- Import da página da câmera

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyExample(),
    );
  }
}

class MyExample extends StatefulWidget {
  const MyExample({super.key});

  @override
  _MyExampleState createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  int _selectedIndex = 0;
  static const String basePath = "assets/images";
  static const String accountImage = "$basePath/account.png";

  final List<Widget> _widgetOptions = [
    const LoginPageWidget(),
    const RegisterPageWidget(),
    const TurmasWidget(),
    const PresencaWidget(),
    CameraPage(), // <-- Página da câmera aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 15,
        selectedIconSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Login',
            icon: Icons.home,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Register',
            icon: Icons.account_box_outlined,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Turmas',
            icon: Icons.calendar_today_outlined,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Presenca',
            icon: Icons.card_giftcard_rounded,
            assetsImagePath: accountImage,
            isAssetsImage: false,
          ),
          CustomBottomBarItems(
            label: 'Camera',
            icon: Icons.camera_alt,
            isAssetsImage: false,
          ),
        ],
      ),
    );
  }
}
