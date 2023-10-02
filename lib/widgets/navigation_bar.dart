import 'package:flutter/material.dart';

class NavigationBarWidget extends StatefulWidget {
  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;

  // Define your navigation items here
  final List<String> navItems = ['Home', 'About', 'Gallery', 'Contact Us'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(navItems.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          onHover: (hovering) {
            if (hovering) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  navItems[index],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: _selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                Container(
                  height: 2,
                  width: 400,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Colors.blue // Color when selected or hovered
                        : Colors.transparent, // Color when not selected
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
