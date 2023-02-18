import 'package:flutter/material.dart';
import '../../../apis/orders.dart';
import '../../../widgets/admin/Order_accept_deny_page.dart';
import '../../../widgets/common/custom_progress.dart';
import '../admin_home.dart';

class Preparing extends StatelessWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getAcceptedOrders(),
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            if(snapshot.data!['accepted'] == false)
            {
              return NoAvailable();
            }
            print('this is the data');
            return ListView.builder(
              itemBuilder: (context, index) => OrderCardAcceptorDeny(
                data: snapshot.data!['orders'][index]
              ),
              itemCount: snapshot.data!['orders'].length,
            );
          }
          else
          {
            return const CustomProgress();

          }
        });
  }
}
