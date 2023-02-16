import 'package:flutter/material.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 17,bottom: 12),
                      child: Text('Roasted Pot',style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                      ),),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 17,top: 16),
                      child: Text('Description of Roasted Pot',style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                      ),),
                    )
                  ]
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17,top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.location_on,
                          size: 14,
                        ),
                        Text('  At Khokha',style: TextStyle(
                          fontSize: 18,
                        ),),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.call,
                        size: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}