import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: 350,
                  child: Card(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        SizedBox(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset('assets/Veg.png'),
                              ),
                              const SizedBox(
                                width: 200,
                                child: Text('Name', style: TextStyle(fontFamily: 'UberMove'),),
                              ),
                              const SizedBox(
                                width: 50,
                                child: Center(child: Text('Qty.', style: TextStyle(fontFamily: 'UberMove'),)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text('Price', style: TextStyle(fontFamily: 'UberMove'),),
                              ),
                              SizedBox(
                                width: 50,
                                child: Center(child: Text('Total', style: TextStyle(fontFamily: 'UberMove'),)),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
          Center(
            child: SizedBox(
              width: 320,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
                backgroundColor: Colors.black, child: const Text('Place here!', style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),


    );
  }
}


