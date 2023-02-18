import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuCard extends StatelessWidget {
  final data;
  const MenuCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 120,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['name'],
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 8),
                      //   child: Image.asset('assets/Must_try.png',height: 12,width: 35,),
                      // ),
                      data['type']=='veg'?
                      Image.asset('assets/Veg.png', height: 18): Image.asset('assets/non_veg.png', height: 18),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        child: Icon(Icons.edit, color: Colors.black, size: 18),
                        onTap: () {
                          // showModalBottomSheet(context: context, builder: (context)=>{
                          //   return Co
                          // })
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
                color: Colors.grey,
                height: 2,
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
                        data['price'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        size: 14,
                      ),
                      Text(
                        '  ${data['startTime']} - ${data['endTime']}',
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
              child: Text(data['description'].toString()),
            ),
          ],
        ),
      ),
    );
  }
}
