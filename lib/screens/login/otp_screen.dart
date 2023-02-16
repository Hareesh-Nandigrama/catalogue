import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'username_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  final bool isCustomer;
  const OTPScreen(
      {Key? key,
      required this.phoneNumber,
      required this.verificationId,
      required this.isCustomer})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isDisabled = true;
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text(
            //   'Verify your Phone Number',
            //   style: TextStyle(
            //     fontSize: 32,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.black,
            //   ),
            // ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Verify your Phone Number',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Please enter the 6 digit code sent to \n',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: '+91 ${widget.phoneNumber} ',
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Wrong Number?',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Change Number',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).pop(),
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.45, right: 30.35),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 28,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.grey),
                style: const TextStyle(fontSize: 14, color: Colors.black),
                onChanged: (value) => {},
                onCompleted: (pin) {
                  otp = pin;
                  setState(() {
                    isDisabled = false;
                  });
                },
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't receive the code?",
                        style: TextStyle(
                          fontSize: 14.23,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend SMS',
                        style: TextStyle(
                          fontSize: 14.23,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 52,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () async {
                  if (isDisabled) {
                    return;
                  } else {
                    try {
                      final auth = FirebaseAuth.instance;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: otp);
                      await auth.signInWithCredential(credential);
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('phone', widget.phoneNumber);
                      await prefs.setBool('isCustomer', widget.isCustomer);
                      if (!mounted) return;
                      showSnackBar('Phone No. Successfully verified');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const UsernameScreen()),
                      );
                    } on FirebaseAuthException catch (_) {
                      showSnackBar('Entered OTP does not match');
                    }
                  }

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => UsernameSreen(data: {
                  //           'phone': widget.phoneNumber,
                  //         })));
                },
                child: CustomButton(
                  isDisabled: isDisabled,
                  buttonname: 'Continue',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
