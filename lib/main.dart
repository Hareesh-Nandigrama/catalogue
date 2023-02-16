import 'package:catalogue/screens/login/first_screen.dart';
import 'package:catalogue/screens/login/username_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

Future<bool> getVerifiedData() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isVerified') ?? false;
}

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
      home: FutureBuilder<bool>(
          future: getVerifiedData(),
          builder: (context, snapshot) {
            return snapshot.hasData 
                ? (snapshot.data ?? false)
                    ? const UsernameScreen()
                    : const FirstScreen()
                :  Container();
          }),
    );
  }
}