import 'package:catalogue/screens/customer/shop_details_page.dart';
import 'package:flutter/material.dart';
class CustomerCard extends StatelessWidget {
  final body;
  const CustomerCard({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShopDetailsPage(data: body,)));
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            clipBehavior: Clip.antiAlias,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 10),
                  )]
            ),
            height: 242,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          'https://th.bing.com/th/id/OIP.Wp6XgnYRrIXB2P0mSTBhBAHaEo?pid=ImgDet&rs=1',
                          fit: BoxFit.cover,
                          height: 192,
                          width: double.infinity,
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17,bottom: 14),
                        child: Text(body['businessName'],style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17,top: 12),
                        child: Text(body['description']!,style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white
                        ),),
                      )
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          const Icon(Icons.location_on,
                            size: 18,
                          ),
                          Text('    ${body['location']}',style: const TextStyle(
                            fontSize: 16,
                          ),),
                        ],
                      ),
                      const Icon(Icons.call,color: Colors.green,),
                    ],
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
