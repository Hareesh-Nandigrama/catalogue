import 'package:catalogue/widgets/customer/search_bar.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid,
      bottom: Platform.isAndroid,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  children: [
                    const Expanded(
                      child: CustomerSearchBar(),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromRGBO(226, 226, 226, 1),
                      child: Image.asset(
                        'assets/profile.png',
                        height: 25,
                        width: 25,
                      ),
                      // backgroundImage: AssetImage('assets/profile.png'),
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/outlet.png',
                height: 136,
                width: 136,
              ),
              CustomButton(isDisabled: false, buttonname: 'Try Again!')
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedLabelStyle: Google,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Food'),
            BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'Stationery'),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc_outlined), label: 'Others'),
          ],
        ),
      ),
    );
  }
}
