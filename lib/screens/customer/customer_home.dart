import 'package:catalogue/widgets/customer/search_bar.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
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
              const Spacer(),
              Image.asset(
                'assets/outlet.png',
                height: 136,
                width: 136,
              ),
              const Text(
                'No Outlets Available',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'We couldn\'t find any shops nearby!',
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomButton(isDisabled: false, buttonname: 'Try Again!'),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {},
        backgroundColor: Colors.white,
        currentIndex: 2,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(84, 84, 84, 1),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/food_selected.png',
                width: 24,
                height: 24,
              ),
              label: 'Food'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/stationary.png',
                width: 24,
                height: 24,
              ),
              label: 'Stationery'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/others.png',
                width: 24,
                height: 24,
              ),
              label: 'Others'),
        ],
      ),
    );
  }
}
