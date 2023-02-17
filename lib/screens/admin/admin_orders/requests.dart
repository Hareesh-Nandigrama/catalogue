import 'package:catalogue/widgets/admin/Order_accept_deny_page.dart';
import 'package:catalogue/widgets/admin/order_card_waiting_for_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        OrderCardAcceptorDeny(),

        Spacer(),

      ],
    );
  }
}