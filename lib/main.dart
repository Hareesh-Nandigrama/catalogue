import 'package:catalogue/screens/admin/admin_home.dart';
import 'package:catalogue/screens/customer/customer_home.dart';
import 'package:catalogue/screens/customer/shop_details_page.dart';
import 'package:catalogue/screens/login/first_screen.dart';
import 'package:catalogue/screens/login/timings_screen.dart';
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

Future<String> getVerifiedData() async {
  String screen = 'first';
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('access_token') != null) {
    screen = 'admin';

    if (prefs.getBool('isCustomer') ?? false) {
      screen = 'customer';
    }
  } else if (prefs.getBool('isVerified') ?? false) {
    screen = 'name';
  }

  return screen;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.grey,
          fontFamily: 'UberMove',
        ),
        home: FirstScreen());

    //   home: FutureBuilder<String>(
    //       future: getVerifiedData(),
    //       builder: (context, snapshot) {
    //         return snapshot.hasData
    //             ? snapshot.data == 'first'
    //                 ? const FirstScreen()
    //                 : (snapshot.data == 'name'
    //                     ? const UsernameScreen()
    //                     : (snapshot.data == 'customer'
    //                         ? const CustomerHome()
    //                         : const AdminHome()))
    //             : Container();
    //       }),
    // );
  }
}
