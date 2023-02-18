import 'package:catalogue/widgets/admin/Order_accept_deny_page.dart';
import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderCardAcceptorDeny(),
      itemCount: 10,
    );
  }
}
