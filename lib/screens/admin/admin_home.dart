import 'package:catalogue/screens/admin/admin_home_menu.dart';
import 'package:catalogue/screens/admin/admin_home_orders.dart';

import 'package:catalogue/screens/login/add_photos.dart';

import 'package:catalogue/screens/login/phone_number_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminOrderStatusState();
}

class _AdminOrderStatusState extends State<AdminHome> {
  List<Widget> _pages = [
    const AdminHomeOrders(),
   const AdminHomeMenu(),
    const AdminHomeOrders(),
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  bool _switchState = false;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(226, 226, 226, 1), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    CupertinoSwitch(
                      activeColor: Colors.green,
                      value: _switchState,
                      onChanged: (value) {
                        setState(() {
                          _switchState = !_switchState;
                        });
                      },
                    ),
                    Row(
                      children: [
                        const Text(
                          'Roasted Pot',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/profile.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                            // backgroundImage: AssetImage('assets/profile.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              _pages[_selectedPageIndex]
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(84, 84, 84, 1),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/food_selected.png',
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                'assets/food.png',
                width: 24,
                height: 24,
              ),
              label: 'Orders'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/stationery_selected.png',
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                'assets/stationery.png',
                width: 24,
                height: 24,
              ),
              label: 'Menu'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/others_selected.png',
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                'assets/Others.png',
                width: 24,
                height: 24,
              ),
              label: 'Insights'),
        ],
      ),
    );
  }
}

class NoAvailable extends StatelessWidget {
  const NoAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/baker.png',
            height: 136,
            width: 136,
          ),
          const Text(
            'No Ongoing Orders',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Hold Still a Customer will soon order from your\n restaurant!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
