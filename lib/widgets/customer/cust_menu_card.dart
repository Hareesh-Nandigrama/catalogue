import 'package:flutter/material.dart';

class CustomerMenuCard extends StatefulWidget {
  final data;
  const CustomerMenuCard({Key? key, this.data}) : super(key: key);

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
                      const Text(
                        '   Paneer Massala',
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
                          // showModalBottomSheet(context: context, builder: (context)=>{
                          //   return Co
                          // })
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
                    children: const [
                      Icon(
                        Icons.currency_rupee,
                        size: 14,
                      ),
                      Text(
                        '190',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.timelapse,
                        size: 14,
                      ),
                      Text(
                        '  10:00 AM-9:00 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text('This is a very good Dish . Must Try'),
            ),
          ],
        ),
      ),
    );
  }
}