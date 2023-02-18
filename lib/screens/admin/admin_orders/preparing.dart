import 'package:catalogue/widgets/admin/order_card.dart';
import 'package:flutter/material.dart';

import '../../../apis/orders.dart';
import '../../../widgets/common/custom_progress.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: getAcceptedOrders(),
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
