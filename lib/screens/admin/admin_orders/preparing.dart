import 'package:catalogue/widgets/admin/order_card.dart';
import 'package:flutter/material.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderReadyCard(),
      itemCount: 10,
    );
  }
}
