import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vnbweb/Desktop_screen/cart_desktop.dart';
import 'package:vnbweb/screens/cart.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
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

  final List<String> imgList = [
    'assets/images/3-1.jpeg',
    'assets/images/d-2.jpg',
    'assets/images/d-3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "H O M E",
          style: TextStyle(color: Colors.black),
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
                  type: PageTransitionType.bottomToTop, child: CartDesktop()));
        },
        label: Text("Buy Now"),
      ),
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeIn(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 800,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.0,
                          initialPage: 0,
                        ),
                        items: imgList
                            .map((item) => Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ))
                            .toList(),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  child: Text(
                    "P r o d u c t   F e a t u r e s",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.deepPurpleAccent,
                          child: Image.asset("assets/images/1.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dual Power Outputs",
                                style: TextStyle(fontSize: 50),
                              ),
                              Text(
                                  "On Spot Energy offers both a 12V DC output and a 230V AC output in one compact package."),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Short Circuit Protection",
                                style: TextStyle(fontSize: 50),
                              ),
                              Text(
                                  "On Spot Energy safeguards against short circuits, ensuring device and user safety."),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.deepPurpleAccent,
                          child: Image.asset("assets/images/1.jpg"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.deepPurpleAccent,
                          child: Image.asset("assets/images/1.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AUTO CHARGE CUT OFF",
                                style: TextStyle(fontSize: 50),
                              ),
                              Text(
                                  "On Spot Energy's auto charge cut-off prevents overcharging, extending battery life and enhancing safety"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200], // Background color for the footer
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0), // Adjust the padding as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Social Media Icons and Links
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Open Facebook profile URL
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Open Twitter profile URL
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Open Instagram profile URL
                        },
                      ),

                      // Privacy Policy Link
                      InkWell(
                        onTap: () {
                          // Open Privacy Policy page or URL
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.blue, // Adjust the color as needed
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
    );
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
