import 'package:catalogue/apis/orders.dart';
import 'package:catalogue/apis/seller.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CancelledOrderCard extends StatefulWidget {
  final data;
  const CancelledOrderCard({Key? key, this.data}) : super(key: key);

  @override
  State<CancelledOrderCard> createState() => _CancelledOrderCardState();
}

class _CancelledOrderCardState extends State<CancelledOrderCard> {
  @override
  Widget build(BuildContext context) {
    num answer = 0;
    for(var item in widget.data['items'])
    {
      answer += item['qty']*item['price'];
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      height: 266,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.red, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        widget.data['_id'].toString().substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Text(widget.data['createdAt']),
                      const Icon(Icons.more_vert_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/profile.png',
                            height: 14,
                            width: 18,
                          ),
                        ),
                        // backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(widget.data['customerId']),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 8),
                //   child: Row(
                //     children: const [
                //       Text('11th order'),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          for (var item in widget.data['items'])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/Veg.png'),
                          height: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text('${item['name']} x${item['qty']}'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          size: 14,
                        ),
                        Text(item['price'] * item['qty']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Total'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 14,
                      ),
                      Text(answer.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const CustomButtonCancelled(buttonname: 'Cancelled')
        ],
      ),
    );
  }
}
class CustomButtonCancelled extends StatelessWidget {
  final String buttonname;
  const CustomButtonCancelled(
      {Key? key,  required this.buttonname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .420,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color:  Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonname,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color:  Colors.red,
              ),
            ),
            const Icon(Icons.clear, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
