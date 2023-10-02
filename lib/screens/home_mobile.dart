import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vnbweb/Desktop_screen/cart_desktop.dart';
import 'package:vnbweb/Desktop_screen/contact_desktop.dart';
import 'package:vnbweb/Desktop_screen/gallery_desktop.dart';
import 'package:vnbweb/Desktop_screen/home_desktop.dart';
import 'package:vnbweb/widgets/navigation_bar.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeDesktop(),
    GalleryDesktop(),
    ContactDesktop(),
    CartDesktop()
  ];
  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavigationRail(
                    elevation: 1,
                    useIndicator: true,
                    selectedIconTheme: IconThemeData(color: Colors.white),
                    indicatorColor: Colors.purpleAccent[100],
                    destinations: [
                      NavigationRailDestination(
                          icon: Icon(EvaIcons.homeOutline),
                          label: Text("Home")),
                      NavigationRailDestination(
                          icon: Icon(EvaIcons.imageOutline),
                          label: Text("Gallery")),
                      NavigationRailDestination(
                          icon: Icon(EvaIcons.emailOutline),
                          label: Text("Contact Us")),
                      NavigationRailDestination(
                          icon: Icon(EvaIcons.shoppingCartOutline),
                          label: Text("Cart")),
                    ],
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: changeDestination),
                VerticalDivider(
                  thickness: 1,
                  width: 10,
                ),
                Expanded(flex: 1, child: _screens[_selectedIndex])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
