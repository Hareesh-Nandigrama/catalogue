import 'package:flutter/material.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          height: 120,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Paneer Massala',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset('assets/Must_try.png',height: 12,width: 35,),
                        ),
                        Image.asset('assets/Veg.png',height: 12),
                        GestureDetector(child: const Icon(Icons.more_vert_rounded ,size: 14,),
                        onTap: (){
                        },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(color: Colors.grey,height: 2,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Row(
                      children: const [
                        Icon(Icons.currency_rupee,size: 14,),
                        Text('190',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.timelapse,size: 14,),
                        Text('  10:00 AM-9:00 PM'),
                      ],
                    ),

                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Text('This is ih fdknf mlknsknkdnnnnnnnnnnnn sdnk sdnk sdknsd sdkns dfknf dfknd fdkf dkf dfk dfkdf'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
