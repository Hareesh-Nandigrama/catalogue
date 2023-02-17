import 'package:flutter/material.dart';
class CustomerCard extends StatelessWidget {
  final body;
  const CustomerCard({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/beach.jpeg',
                          fit: BoxFit.cover,
                          height: 192,
                          width: double.infinity,
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 17,bottom: 12),
                        child: Text(body['businessName'],style: TextStyle(
                            fontSize: 24,
                            color: Colors.white
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 17,top: 12),
                        child: Text(body['businessName'],style: TextStyle(
                            fontSize: 12,
                            color: Colors.white
                        ),),
                      )
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.circle,
                        color: Colors.green,
                        size: 8,
                      ),
                      Text('  Currently open',style: TextStyle(
                        fontSize: 10,
                      ),),
                    ],
                  ),
                ),

              ],
            )
        );
  }
}
