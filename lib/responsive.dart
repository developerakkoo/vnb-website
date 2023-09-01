import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key, required this.mobileWidget, required this.desktopWidget});

  final Widget mobileWidget;
  final Widget desktopWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return mobileWidget;
        } else {
          return desktopWidget;
        }
      },
    );
  }
}
