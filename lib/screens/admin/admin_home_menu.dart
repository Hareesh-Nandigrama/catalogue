import 'package:catalogue/widgets/admin/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminHomeMenu extends StatefulWidget {
  const AdminHomeMenu({super.key});

  @override
  State<AdminHomeMenu> createState() => _AdminHomeMenuState();
}

class _AdminHomeMenuState extends State<AdminHomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.red,),
      ],
    );
    // return Expanded(
    //   child: MenuCard(),

    // );
  }
}
