import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerShopCard extends StatelessWidget {
  const CustomerShopCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 100,
              spreadRadius: 0.1,
              offset: Offset(0, 10),
            )
          ],
          border: Border.all(
              color: const Color.fromRGBO(175, 175, 175, 1), width: 1),
        ),
        height: 400,
        width: MediaQuery.of(context).size.width-32,
        child: Column(
          children: [
            Image.asset('assets/beach.jpeg',fit: BoxFit.contain,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Roasted Pot',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
              child: Text('Very Good Shop Must Try Hygenic Food and Nice Pricings',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.location_on_outlined),
                      Text('  At Khokha'),
                    ],
                  ),
                  IconButton(icon:Icon(Icons.call,color: Colors.green,),
                    onPressed: () async {
                      print('hehe');
                      const url = 'tel:8252993486';
                      await launchUrl(Uri.parse(url));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}