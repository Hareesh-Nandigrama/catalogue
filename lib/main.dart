import 'package:catalogue/screens/admin/admin_splash.dart';
import 'package:catalogue/screens/customer/customer_home.dart';
import 'package:catalogue/screens/login/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'UberMove',
      ),
      home: const CustomerHome(),
    );
  }
}
