import 'package:catalogue/screens/admin/admin_home.dart';
import 'package:catalogue/widgets/admin/Order_accept_deny_page.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:flutter/material.dart';
import '../../../apis/orders.dart';
class Requests extends StatelessWidget {
  const Requests({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getPendingOrders(),
        builder: (context,snapshot){
          print(snapshot.data);
          if(snapshot.hasData)
          {
            print(snapshot.data);
            if(snapshot.data!['pending'] == false)
            {
              return NoAvailable();
            }
            return ListView.builder(
              itemBuilder: (context, index) => const OrderCardAcceptorDeny(),
              itemCount: snapshot.data!['orders'].length,
            );
          }
          else
          {
            return const CustomProgress();

          }
        });
    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     future: getPendingOrders();
    //     if(snapshot.hasData){
    //       print(snapshot.data);
    //       return ListView.builder(
    //         itemBuilder: (context, index) => const OrderCardAcceptorDeny(),
    //         itemCount: 10,
    //       );
    //     }else{
    //       return const CustomProgress();
    //     }
    //   },
    // );
  }
}
