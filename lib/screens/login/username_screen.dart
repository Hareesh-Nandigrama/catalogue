import 'package:catalogue/apis/login.dart';
import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/screens/customer/customer_home.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_screen.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController usersName = TextEditingController();
  bool disabled = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'What shall we call you?',
                      textAlign: TextAlign.left,
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
                  keyboardType: TextInputType.name,
                  onTap: () {},
                  controller: usersName,
                  onChanged: (value) {
                    if (usersName.text.isNotEmpty) {
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
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(175, 175, 175, 1),
                    ),
                    labelText: "Name",
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
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (disabled) return;
                  final prefs = await SharedPreferences.getInstance();
                  final isCustomer = prefs.getBool('isCustomer') ?? false;
                  final phoneNumber = prefs.getString('phone') ?? '';
                  final uid = prefs.getString('uid') ?? '';

                  Map<String, dynamic> data = {};
                  data['username'] = usersName.text;

                  if (!mounted) return;

                  //TODO: PUSH VERIFIED CUSTOMER TO BACKEND

                  if (isCustomer) {
                    try {
                      await createCustomer(phoneNumber, usersName.text, uid);
                      showSnackBar('Your Acoount is successfully created');
                    } catch (e) {}

                    setState(() {
                      isLoading = false;
                    });

                    if (!mounted) return;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const CustomerHome(),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BusinessNameScreen(data: data),
                      ),
                    );
                  }
                },
                child: CustomButton(
                  isDisabled: disabled,
                  buttonname: 'Next',
                ),
              ),
            ],
          ),
          Visibility(visible: isLoading, child: const CustomProgress())
        ],
      ),
    );
  }
}
