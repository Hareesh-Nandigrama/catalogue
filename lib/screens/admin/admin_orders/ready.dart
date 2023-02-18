import 'package:flutter/material.dart';

import '../../../apis/orders.dart';
import '../../../widgets/admin/Order_accept_deny_page.dart';
import '../../../widgets/common/custom_progress.dart';
import '../admin_home.dart';

class Ready extends StatefulWidget {
  const Ready({Key? key}) : super(key: key);

  @override
  State<Ready> createState() => _ReadyState();
}

class _ReadyState extends State<Ready> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getReadyOrders(),
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            if(snapshot.data!['completed'] == false)
            {
              return NoAvailable();
            }
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
