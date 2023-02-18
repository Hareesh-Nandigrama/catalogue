import 'package:catalogue/screens/login/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/login/button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/beach.jpeg',
            width: MediaQuery.of(context).size.width,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 24),
            child: Text(
              'Hello, Roasted Pot',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12),
            child: Divider(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                    ),
                    Text(
                      '    Location:',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '    Khokha',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Icon(
                      Icons.call_outlined,
                      size: 18,
                    ),
                    Text(
                      '    Contact:',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '    6202850029',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Icon(
                      Icons.person_outline_outlined,
                      size: 18,
                    ),
                    Text(
                      '    Moneymaker:',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '    Chinmay',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: EditProfileButton(buttonname: '   Edit Profile'),
          ),
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => FirstScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: LogoutOutlinedButton(buttonname: '    Logout'),
            ),
          ),
        ],
      )),
    );
  }
}
