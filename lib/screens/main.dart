import 'package:flutter/material.dart';
import 'package:vnbweb/responsive.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:vnbweb/screens/home_mobile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Responsive(
        mobileWidget: HomeMobileScreen(),
        desktopWidget: HomeScreen(),
      ),
    );
  }
}
