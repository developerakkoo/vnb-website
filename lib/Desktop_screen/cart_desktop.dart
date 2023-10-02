import 'package:flutter/material.dart';

class CartDesktop extends StatefulWidget {
  const CartDesktop({super.key});

  @override
  State<CartDesktop> createState() => _CartDesktopState();
}

class _CartDesktopState extends State<CartDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "C A R T",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
