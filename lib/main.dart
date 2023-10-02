import 'package:flutter/material.dart';
import 'package:vnbweb/screens/cart.dart';
import 'package:vnbweb/screens/contact.dart';
import 'package:vnbweb/screens/details.dart';
import 'package:vnbweb/screens/gallery_screen.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vnbweb/screens/home_mobile.dart';
import 'package:vnbweb/screens/main.dart';
import 'package:vnbweb/screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDIyi1FFjEVoIK54_PaTnpSJb9jAEsTyvQ",
          appId: "1:1039331676287:web:0ae1f413e44431eeaa2f4a",
          messagingSenderId: "1039331676287",
          projectId: "onspot-c07d1",
          authDomain: "onspot-c07d1.firebaseapp.com"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VNB Motors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CartScreen(),
      },
    );
  }
}
