import 'package:catalogue/controllers/validation.dart';
import 'package:flutter/material.dart';
import './template.dart';
import '../../widgets/login/button.dart';
import './otp_screen.dart';

class EmailScreen extends StatefulWidget {
  final String phone;
  const EmailScreen({super.key, required this.phone});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController emailControl = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Enter your email address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                validator: validateEmail,
                onChanged: (value) {
                  emailControl.text = value;

                  if (_key.currentState!.validate()) {
                    setState(() {
                      disabled = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  // suffixIcon: const ImageIcon(
                  //     AssetImage('assets/tick_mark.png',),
                  // ),
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(175, 175, 175, 1),
                  ),
                  labelText: "Email Address",
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(175, 175, 175, 1),
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(175, 175, 175, 1),
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(175, 175, 175, 1),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: CustomButton(
                isDisabled: disabled,
                buttonname: 'Next',
              ),
              onTap: () {
                if (_key.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => OTPScreen(
                            phoneNumber: widget.phone,
                            email: emailControl.text,
                          )));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
