import 'package:catalogue/apis/orders.dart';
import 'package:catalogue/screens/customer/customer_orders/unpaid_card.dart';
import 'package:flutter/material.dart';

import '../../../widgets/admin/Order_accept_deny_page.dart';
import '../../../widgets/common/custom_progress.dart';

class PendingPayment extends StatelessWidget {
  const PendingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getPendOrdersCustomer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);

            if (snapshot.data!['allOrders'].length == 0) {
              return Center(
                child: Text('No Awaiting orders'),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => Unpaid(
                  data: snapshot.data!['allOrders'][index]),
              itemCount: snapshot.data!['allOrders'].length,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomProgress();
          } else {
            return Center(
              child: Text('No Awaiting orders'),
            );
          }
        });
  }
}