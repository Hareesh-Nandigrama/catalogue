import 'package:flutter/material.dart';

import '../../models/menu.dart';
import '../../screens/customer/cart_store.dart';

class CustomerMenuCard extends StatefulWidget {
  final Menu data;
  const CustomerMenuCard({Key? key, required this.data}) : super(key: key);

  @override
  State<CustomerMenuCard> createState() => _CustomerMenuCardState();
}

class _CustomerMenuCardState extends State<CustomerMenuCard> {
  int noOfItem=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 128,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/Veg.png', height: 18),
                      Text(
                        '   '+widget.data.name,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(

                    children: [

                      const SizedBox(width: 8,),
                      GestureDetector(
                        child: const Icon(Icons.minimize_rounded,color: Colors.black,size: 18),
                        onTap: () {
                          setState(() {
                            noOfItem>0?noOfItem--:0;
                          });
                          CartStore.deleteItem(widget.data);
                        },
                      ),
                      Padding(
                        padding:  const EdgeInsets.only(top: 9),
                        child: Text('  $noOfItem   ',style: const TextStyle(fontSize: 18),),
                      ),
                      GestureDetector(
                        child: const Padding(
                          padding:  EdgeInsets.only(top: 9),
                          child: Icon(Icons.add,color: Colors.black,size: 18),
                        ),
                        onTap: () {
                          setState(() {
                            noOfItem++;
                          });
                          CartStore.addItem(widget.data);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 14,
                      ),
                      Text(
                        widget.data.price.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children:  [
                      Icon(
                        Icons.timelapse,
                        size: 14,
                      ),
                      Text(
                        '  '+widget.data.startTime.toString() + ' - '+widget.data.endTime.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(widget.data.description),
            ),
          ],
        ),
      ),
    );
  }
}