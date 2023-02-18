import 'package:catalogue/apis/login.dart';
import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/screens/admin/admin_home.dart';
import 'package:catalogue/widgets/admin/admin_card.dart';
import 'package:catalogue/widgets/admin/menu_page.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/template.dart';
import 'package:flutter/cupertino.dart';
import '../../widgets/login/button.dart';

class AdminSplash extends StatefulWidget {
  final data;

  const AdminSplash({super.key, required this.data});

  @override
  State<AdminSplash> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminSplash> {
  bool _switchState = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                ),
                AdminCard(
                  data: widget.data,
                  
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();

                        final phone = prefs.getString('phone') ?? '';
                        final uid = prefs.getString('uid') ?? '';
                        final data = widget.data;

                        try {
                          createShopkeeper(
                            phone,
                            data['username'],
                            data['businessName'],
                            data['type'],
                            data['location'],
                            data['closes'],
                            data['opens'],
                            data['photos'],
                            uid,
                          );
                        } catch (e) {
                          print(e);
                        }
                        if (!mounted) return;
                        showSnackBar('Succesfully Registered');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) => AdminHome(),
                            ),
                            ModalRoute.withName('/'));
                      },
                      child: const CustomOutlinedButton(
                        buttonname: 'Skip for later',
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MenuPage(),
                          ),
                        );
                      },
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
                        style: TextStyle(
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
                      style: TextStyle(
                        color: const Color.fromRGBO(117, 117, 117, 1),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              child: CustomProgress(),
              visible: _isLoading,
            )
          ],
        ),
      ),
    ));
  }
}
