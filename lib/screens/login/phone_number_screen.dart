import 'package:catalogue/screens/login/template.dart';

import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import '../../controllers/otp_auth.dart';

class PhoneNumberScreen extends StatefulWidget {

  final isCustomer;
  const PhoneNumberScreen({super.key, required this.isCustomer});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneNum = TextEditingController();
  bool disabled = true;
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Enter phone Number',
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
              onChanged: (value) {
                phoneNum.text = value;
                if (phoneNum.text.trim().length == 10) {
                  setState(() {
                    disabled = false;
                  });
                } else {
                  setState(() {
                    disabled = true;
                  });
                }
              },
              decoration: InputDecoration(
                // suffixIcon: const ImageIcon(
                //     AssetImage('assets/tick_mark.png',),
                // ),
                hintText: 'Number',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(175, 175, 175, 1),
                ),
                labelText: "Number",
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
            onTap: () async {
              if (disabled) {
                return;
              } else {
                FocusManager.instance.primaryFocus?.unfocus();
                await phoneNumber(phoneNum.text.trim(), widget.isCustomer);
              }
            },
          ),
        ],
      ),
    );
  }
}
