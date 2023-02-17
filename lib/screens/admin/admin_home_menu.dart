import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/admin/menu_card.dart';

class AdminHomeMenu extends StatefulWidget {
  const AdminHomeMenu({super.key});

  @override
  State<AdminHomeMenu> createState() => _AdminHomeMenuState();
}

class _AdminHomeMenuState extends State<AdminHomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MenuCard(),
    );
  }
}
