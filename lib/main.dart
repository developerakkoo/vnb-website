import 'package:flutter/material.dart';
import 'package:vnbweb/screens/contact.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vnbweb/screens/home_mobile.dart';
import 'package:vnbweb/screens/main.dart';
import 'package:vnbweb/screens/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialize = Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDIyi1FFjEVoIK54_PaTnpSJb9jAEsTyvQ",
          appId: "1:1039331676287:web:0ae1f413e44431eeaa2f4a",
          messagingSenderId: "1039331676287",
          projectId: "onspot-c07d1",
          authDomain: "onspot-c07d1.firebaseapp.com"));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VNB Motors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialize,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MainScreen();
          }

          return CircularProgressIndicator();
        }),
      ),
    );
  }
}
