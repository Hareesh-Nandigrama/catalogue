import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Menu   ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  'assets/menu.png',
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  'assets/nonvegicon.png',
                  height: 26.73,
                  width: 106.73,
                ),
              ),
              Image.asset(
                'assets/vegicon.png',
                height: 26.73,
                width: 79.63,
              ),
            ],
          ),
          const MenuCard(),
        ],
      )),
    );
  }
}
