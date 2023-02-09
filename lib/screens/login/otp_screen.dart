import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'username_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Email Address',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
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
                    text: '${widget.phoneNumber} ',
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
              text:  TextSpan(
                children: [
                  const TextSpan(
                    text: 'Wrong email?',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: 'Change Email',
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
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 28,
                  fieldStyle: FieldStyle.underline,
                  otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.grey),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  onChanged: (pin) {},
                  onCompleted: (pin) {}),
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
                        text: 'Resend email',
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UsernameSreen(data: {
                            'phone': widget.phoneNumber,
                          })));
                },
                child: const CustomButton(
                  isDisabled: false,
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
