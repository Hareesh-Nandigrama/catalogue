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

      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ShopsScreen(index: _selectedPageIndex),
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


