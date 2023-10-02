import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vnbweb/screens/cart.dart';
import 'package:vnbweb/screens/contact.dart';
import 'package:vnbweb/screens/gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  double _value = 100;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_value == 135) {
        timer.cancel();
        return;
      }
      setState(() {
        _value = _value + 1;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff00416a), Color(0xffe4e5e6)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: CartScreen()));
                },
                icon: Icon(
                  EvaIcons.shoppingCartOutline,
                  color: Colors.black,
                ))
          ],
          title: const Text(
            'H O M E',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible
                        ? EvaIcons.closeCircle
                        : EvaIcons.menu2Outline,
                    key: ValueKey<bool>(value.visible),
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          // elevation: 3,
          backgroundColor: Colors.amber,
          icon: Icon(EvaIcons.shoppingCartOutline),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.bottomToTop, child: CartScreen()));
          },
          label: Text("Buy Now"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.asset(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ))
                    .toList(),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "P r o d u c t   F e a t u r e s",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Feature_Widget(),
              SizedBox(
                height: 20,
              ),
              Text("P r o d u ct   S o l d",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              AnimatedFlipCounter(
                value: _value,
                duration: Duration(seconds: 2),
                padding: EdgeInsets.symmetric(vertical: 8),
                curve: Curves.elasticOut,
                textStyle: TextStyle(
                    fontSize: 60,
                    color: Colors.purple[300],
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              Text("P r o d u ct   A p p l i c a t i o n s",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Applications_widget(),
            ],
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _advancedDrawerController.toggleDrawer();
                  },
                  leading: Icon(EvaIcons.homeOutline),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: GalleryScreen()));
                  },
                  leading: Icon(EvaIcons.imageOutline),
                  title: Text('Gallery'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: ContactUsPage()));
                  },
                  leading: Icon(EvaIcons.emailOutline),
                  title: Text('Contact us'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> imgList = ['assets/images/1-1.png'];

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class Feature_Widget extends StatelessWidget {
  const Feature_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.activity)),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "250V",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.moon)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Cost",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Long Battery",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Applications_widget extends StatelessWidget {
  const Applications_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.sunOutline)),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "LED",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.moon)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Tube Lights",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Mobile Charging",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Bluetooth Speakers",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Wifi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Agri Spray Pump",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "12V DC Motor",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 170,
              height: 181,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                    110, 76, 248, 0.149), // Opacity background color
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(EvaIcons.battery)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "DC Fans & Lights",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
