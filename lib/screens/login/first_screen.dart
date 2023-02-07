import 'package:catalogue/screens/login/phone_number_screen.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const PhoneNumberScreen()));
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
