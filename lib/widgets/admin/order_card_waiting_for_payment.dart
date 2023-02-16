import 'package:flutter/material.dart';

class OrderCardWaitingForPayment extends StatelessWidget {
  const OrderCardWaitingForPayment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 17),
            height: 270,
            width: double.infinity,
            decoration:  BoxDecoration(
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
                    children:  [
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
                            Text('18th Feb 2023 | '),
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
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: const [
                            Icon(Icons.account_circle_rounded),
                            Padding(
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
                            Icon(
                                Icons.timelapse
                            ),
                            Text('6:23 mins'),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 8,right: 8),
                  child:  Divider( color: Colors.grey,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: const [
                            Image(image: AssetImage('assets/Veg.png'),height: 25,),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text('Paneer Tikka X1'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: const [
                            Icon(Icons.currency_rupee,size: 14,),
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
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: const [
                            Image(image: AssetImage('assets/Veg.png'),height: 25,),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text('Tandoori Roti X2'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: const [
                            Icon(Icons.currency_rupee,size: 14,),
                            Text('80'),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 8,right: 8),
                  child:  Divider( color: Colors.grey,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
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
                            Icon(Icons.currency_rupee,size: 14,),
                            Text('250'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8),
                  child:  Divider( color: Colors.grey,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                  child: Column(
                    children: [
                      const Text('Waiting for payment',style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                              Icons.timelapse
                          ),
                          Text('6:23 mins'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
