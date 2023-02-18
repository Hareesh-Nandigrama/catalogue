import 'package:catalogue/screens/customer/cart_store.dart';
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
          onPressed: () {
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
                for (var key in CartStore.detail.keys)
                  SizedBox(
                    width: 350,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                  child:
                                      CartStore.detail[key]!.category == 'Veg'
                                          ? Image.asset('assets/Veg.png')
                                          : Image.asset('assets/NonVeg.png'),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    CartStore.detail[key]!.name,
                                    style: TextStyle(fontFamily: 'UberMove'),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Center(
                                      child: Text(
                                    'Qty.' +
                                        CartStore.cartItems[key].toString(),
                                    style: TextStyle(fontFamily: 'UberMove'),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 15,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Price: ' +
                                        CartStore.detail[key]!.price.toString(),
                                    style: TextStyle(fontFamily: 'UberMove'),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Center(
                                      child: Text(
                                    'Total' +
                                        (CartStore.detail[key]!.price *
                                                CartStore.cartItems[key]!)
                                            .toString(),
                                    style: TextStyle(fontFamily: 'UberMove'),
                                  )),
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero),
                backgroundColor: Colors.black,
                child: const Text(
                  'Place here!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
