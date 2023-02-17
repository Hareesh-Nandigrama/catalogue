import 'package:catalogue/widgets/customer/customer_card.dart';
import 'package:flutter/material.dart';

import '../../apis/seller.dart';

class ShopsScreen extends StatefulWidget {
  final int index;
  const ShopsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<dynamic>>(
            future: getShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CircularProgressIndicator()
                        );
                      }),
                );
              } else if (snapshot.hasData) {
                List<dynamic> allShops = snapshot.data!;


                  return Expanded(
                      child: allShops.isNotEmpty
                          ? ListView.builder(
                          itemCount: allShops.length,
                          itemBuilder: (context, index) {
                            return CustomerCard(
                                body:
                                allShops[index]);
                          })
                          : Center(
                        child:
                        Text("No Result found"),
                      ));
              }
              return CircularProgressIndicator();
            })
      ],
    );
  }
}

