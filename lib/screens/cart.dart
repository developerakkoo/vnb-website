import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemCount = 1;
  bool isFinished = false;

  void incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: HomeScreen()));
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'C a r t',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElasticInLeft(
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.purple[
                                300], // You can replace this with your product image
                          ),
                          // Replace the child with your product image
                          child: Image.asset("assets/images/3.png"),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'On Spot Energy',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\1230.00',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\128.00',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[200]
                          // You can replace this with your product image
                          ),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: decrementCount,
                          ),
                          Text(
                            itemCount.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: incrementCount,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElasticInRight(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SwipeableButtonView(
                buttonText: 'SLIDE TO PLACE ORDER',
                buttonWidget: Container(
                  height: 150,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
                activeColor: Colors.purpleAccent,
                isFinished: isFinished,
                onWaitingProcess: () {
                  print("Open a Dialog With Form");
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                onFinish: () async {
                  // await Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.fade, child: HomeScreen()));
                  _launchWhatsApp("917767952154", "Hi From Akkoo");
                  //TODO: For reverse ripple effect animation
                  setState(() {
                    isFinished = false;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  // Function to launch WhatsApp with a message
  void _launchWhatsApp(String phoneNumber, String message) async {
    print("start");
    var androidUrl =
        "whatsapp://send?phone=$phoneNumber&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$phoneNumber?text=${Uri.parse('Hi, I need some help')}";

    await launchUrl(Uri.parse(androidUrl));
  }
}
