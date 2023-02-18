import 'package:catalogue/apis/orders.dart';
import 'package:catalogue/models/menu.dart';
import 'package:catalogue/screens/customer/cart_store.dart';
import 'package:catalogue/widgets/customer/cust_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/seller.dart';
import '../../widgets/common/shimmer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ShopDetailsPage extends StatefulWidget {
  final data;
  const ShopDetailsPage({Key? key, this.data}) : super(key: key);

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {

  var _razorpay = Razorpay();



  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }



  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds


  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartStore.clear();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(84, 84, 84, 1),
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/food_selected.png',
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                'assets/food.png',
                width: 24,
                height: 24,
              ),
              label: 'Menu'),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/stationery_selected.png',
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                'assets/stationery.png',
                width: 24,
                height: 24,
              ),
              label: 'Cart'),
        ],
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.clear))
        ],
      ),
      body: _selectedPageIndex == 0 ?Column(
        children: [
              FutureBuilder<List<Menu>>(
                  future: getMenu(widget.data['_id']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: ShowShimmer(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasData) {
                      List<Menu> allShops = snapshot.data!;
                      return Expanded(
                          child: allShops.isNotEmpty
                              ? ListView.builder(
                              itemCount: allShops.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CustomerMenuCard(data: allShops[index],),
                                    // Text(allShops[index].name),
                                    // ElevatedButton(onPressed: (){
                                    //
                                    // }, child: Text('add')),
                                    // ElevatedButton(onPressed: (){
                                    //   CartStore.deleteItem(allShops[index]);
                                    // }, child: Text('delete'))
                                  ],
                                );
                              })
                              : const Center(
                            child:
                            Text("No items on menu"),
                          ));
                    }
                    return const CircularProgressIndicator();
                  })
                  ],
      ):Column(
        children: [
          SizedBox(
            height: 600,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                for(var key in CartStore.detail.keys)
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
                                  child: CartStore.detail[key]!.category == 'Veg'?Image.asset('assets/Veg.png'):Image.asset('assets/NonVeg.png'),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(CartStore.detail[key]!.name, style: TextStyle(fontFamily: 'UberMove'),),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Center(child: Text('Qty.'+CartStore.cartItems[key].toString(), style: TextStyle(fontFamily: 'UberMove'),)),
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
                                  child: Text('Price: '+CartStore.detail[key]!.price.toString(), style: TextStyle(fontFamily: 'UberMove'),),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Center(child: Text('Total'+(CartStore.detail[key]!.price*CartStore.cartItems[key]!).toString(), style: TextStyle(fontFamily: 'UberMove'),)),
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
        
      floatingActionButton: ElevatedButton(onPressed: (){
        var options = {
          'key': 'rzp_test_lH1Cp1gS0WSphU',
          'amount': 10000,
          'name': 'Acme Corp.',
          'description': 'Fine T-Shirt',
          'prefill': {
            'contact': '8888888888',
            'email': 'test@razorpay.com'
          }
        };
        _razorpay.open(options);











      },child: Text('pay'),),
      // floatingActionButton: _selectedPageIndex == 1? ElevatedButton(onPressed: ()async{
      //   print('a');
      //   final prefs =await SharedPreferences.getInstance();
      //   print('b');
      //
      //   final uid = prefs.getString('uid') ?? '';
      //   print('this is the uid');
      //   print(uid);
      //   print('c');
      //
      //   createNewOrder(uid, widget.data['_id'], CartStore.getOrder());
      //   print('d');
      //
      // },
      //     child: Text('hello')):Container(),
    );
  }
}
