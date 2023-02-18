import 'package:catalogue/widgets/admin/Order_accept_deny_page.dart';
import 'package:catalogue/widgets/admin/order_card.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:flutter/material.dart';
import '../../../apis/orders.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
   

        if (snapshot.hasData) {
          print(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) => const OrderReadyCard(),
            itemCount: 10,
          );
        } else {
          return const CustomProgress();
        }
      },
    );
  }
}
