import 'package:catalogue/screens/login/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
              icon: Icon(
                Icons.logout_sharp,
                color: Colors.red,
              )),
        ],
      ),
      body: Column(),
    );
  }
}
