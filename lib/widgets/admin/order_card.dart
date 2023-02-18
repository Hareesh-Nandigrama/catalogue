import 'package:flutter/material.dart';
import '../login/button.dart';
class OrderReadyCard extends StatelessWidget {
  const OrderReadyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 8),
      height: 266,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
            color: Colors.black,
            width: 1
        ),
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
                    children: const [
                      Text('Order ID-2345',),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: const [
                      Text('18th Feb 2023  | '),
                      Text('7:23PM'),
                      Icon(Icons.more_vert_rounded),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Chinmay Zinjal'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: const [
                      Text('11th order'),
                    ],
                  ),
                ),

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(color: Colors.grey,),
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
                      Image(image: AssetImage('assets/Veg.png'), height: 22,),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Paneer Tikka x1'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.currency_rupee, size: 14,),
                      Text('170'),
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
                    children: const [
                      Image(image: AssetImage('assets/Veg.png'), height: 22,),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Tandoori Roti x2'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.currency_rupee, size: 14,),
                      Text('80'),
                    ],
                  ),
                ),

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(color: Colors.grey,),
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
                    children: const [
                      Icon(Icons.currency_rupee, size: 14,),
                      Text('250'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(color: Colors.grey,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              CustomButton(isDisabled: false, buttonname: 'Order Ready'),
            ],
          )
        ],
      ),
    );
  }
}
