
import 'package:catalogue/screens/admin/admin_order_status_page.dart';
import 'package:catalogue/screens/login/first_screen.dart';
import 'package:catalogue/widgets/admin/edit_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'UberMove',
      ),
      home: const EditMenu(),
    );
  }
}
