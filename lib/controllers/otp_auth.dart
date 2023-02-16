import 'package:catalogue/main.dart';
import 'package:catalogue/screens/login/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> showSnackBar(String message) async {
  final snackbar = SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    ),

    // ignore: use_build_context_synchronously
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(50),
  );

  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackbar);
}

Future<void> phoneNumber(String phoneNumber, bool isCustomer) async {
  
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 $phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) async {
        if (e.code == 'invalid-phone-number') {
          await showSnackBar('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        await showSnackBar('Sent OTP Successfully');

        Future.delayed(
          const Duration(microseconds: 8000),
          () => {
            Navigator.of(navigatorKey.currentContext!).push(
              MaterialPageRoute(
                builder: (BuildContext context) => OTPScreen(
                  phoneNumber: phoneNumber,
                  verificationId: verificationId,
                  isCustomer: isCustomer,
                ),
              ),
            )
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } on FirebaseAuthException catch (e) {
    await showSnackBar(e.message.toString());
  }
}
