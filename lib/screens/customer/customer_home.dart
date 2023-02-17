import 'package:catalogue/screens/customer/shops_screen.dart';
import 'package:catalogue/widgets/customer/search_bar.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        actions: [
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
        ]
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ShopsScreen(
          index: _selectedPageIndex
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
              label: 'Food'),
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
              label: 'Stationery'),
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
              label: 'Others'),
        ],
      ),
    );
  }
}

class NoOutlets extends StatelessWidget {
  const NoOutlets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(226, 226, 226, 1), width: 1),
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
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomButton(isDisabled: false, buttonname: 'Try Again!'),
        const Spacer(),
      ],
    );
  }
}
