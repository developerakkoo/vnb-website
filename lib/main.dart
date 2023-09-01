import 'package:flutter/material.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vnbweb/screens/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

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
