
import 'package:catalogue/widgets/customer/customer_card.dart';
import 'package:flutter/material.dart';

class AdminHomeMenu extends StatefulWidget {
  const AdminHomeMenu({super.key});

  @override
  State<AdminHomeMenu> createState() => _AdminHomeMenuState();
}

class _AdminHomeMenuState extends State<AdminHomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomerCard(),
    );
  }
}
