import 'package:catalogue/screens/login/phone_number_screen.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var countrycode = '+91';
  var phone = '77838389912';

  Future<void> phoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 7783839912',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        print('sent otp successfully');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Lets get started',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          const Text(
            'Are you a',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const PhoneNumberScreen()));
            },
            child: const CustomButton(
              isDisabled: false,
              buttonname: 'Buisness',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'or',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await phoneNumber();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         const PhoneNumberScreen()));
            },
            child: const CustomButton(
              isDisabled: false,
              buttonname: 'Customer',
            ),
          ),
        ]),
      ),
    );
  }
}
