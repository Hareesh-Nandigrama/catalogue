import 'package:catalogue/widgets/admin/edit_menu.dart';
import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const MenuCard(),
              itemCount: 10,
            ),
          ),

          // EditMenu(),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.all(10),
                      child: EditMenu()),
                );

                
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 32,
                child: Icon(Icons.add),
              ))
        ],
      ),
    );
  }
}
