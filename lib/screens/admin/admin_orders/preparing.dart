import 'package:catalogue/widgets/admin/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        OrderReadyCard(),
        Spacer(),
      ],
    );
  }
}
