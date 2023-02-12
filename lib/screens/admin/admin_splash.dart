import 'package:catalogue/widgets/admin/admin_card.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../login/template.dart';
import 'package:flutter/cupertino.dart';
import '../../widgets/login/button.dart';
class AdminSplash extends StatefulWidget {
  const AdminSplash({super.key});

  @override
  State<AdminSplash> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminSplash> {
  bool _switchState = false;
  

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: GoogleFonts.abyssinicaSil(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(79, 79, 79, 1),
              ),
            ),
            Text(
              'Roasted Pot',
              style: GoogleFonts.abyssinicaSil(
                height: 1,
                fontSize: 41,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const AdminCard(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Are you open right \nnow?',
                    maxLines: 2,
                    style: GoogleFonts.abyssinicaSil(
                      height: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: Colors.black,
                    value: _switchState,
                    onChanged: (value) {
                      setState(() {
                        _switchState = !_switchState;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CustomOutlinedButton(
                    buttonname: 'Skip for later',
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CustomButton(
                    isDisabled: false,
                    buttonname: 'Add Menu',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adding menu will attract more customers',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 14,
                        color: const Color.fromRGBO(117, 117, 117, 1)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/idea.png',
                  height: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Tip: More customers means more money!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abyssinicaSil(
                    color: const Color.fromRGBO(117, 117, 117, 1),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
