import 'dart:convert';
import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/screens/customer/cart_store.dart';
import 'package:catalogue/widgets/customer/cust_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/seller.dart';
import '../../widgets/common/shimmer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class ShopDetailsPage extends StatefulWidget {
  final data;
  const ShopDetailsPage({Key? key, this.data}) : super(key: key);

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  var _razorpay = Razorpay();

  int _selectedPageindex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ))
        ],
      ),
      body: _selectedPageindex == 0
          ? Column(
        children: [
          FutureBuilder<dynamic>(
              future: getMenu(widget.data['_id']),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            padding:
                            const EdgeInsets.symmetric(vertical: 8),
                            child: ShowShimmer(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasData) {
                  List<dynamic> allShops = snapshot.data!;

                  return Expanded(
                      child: allShops.isNotEmpty
                          ? ListView.builder(
                          itemCount: allShops.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CustomerMenuCard(
                                  data: allShops[index],
                                ),
                                // Text(allShops[0].name),
                                // ElevatedButton(onPressed: (){
                                //
                                // }, child: Text('add')),
                                // ElevatedButton(onPressed: (){
                                //   CartStore.deleteItem(allShops[0]);
                                // }, child: Text('delete'))
                              ],
                            );
                          })
                          : const Center(
                        child: Text("No items on menu"),
                      ));
                }
                return const CircularProgressIndicator();
              })
        ],
      )
          : Center(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: CartStore.cartItems.keys.length,
                  itemBuilder: (context, index) {
                    var list = CartStore.cartItems.keys.toList();
                    final total = (int.parse(CartStore
                        .detail[list[index]]!['price']
                        .toString()) *
                        CartStore.cartItems[list[index]]!);

                    return SizedBox(
                        width: 350,
                        child: Card(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CartStore.detail[list[index]]![
                                        'category'] ==
                                            'veg'
                                            ? Image.asset('assets/Veg.png')
                                            : Image.asset(
                                            'assets/non_veg.png'),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          CartStore
                                              .detail[list[index]]!['name']
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'UberMove',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Center(
                                            child: Text(
                                              'Qty. ${CartStore.cartItems[list[index]]!.toString()}',
                                              style: TextStyle(
                                                fontFamily: 'UberMove',
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.currency_rupee_sharp,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          'Price:  ${CartStore.detail[list[index]]!['price'].toString()}',
                                          style: TextStyle(
                                              fontFamily: 'UberMove'),
                                        ),
                                      ),
                                      Text(
                                        'Total: $total',
                                        style:
                                        TextStyle(fontFamily: 'UberMove'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )));
                  }),
            ),
            GestureDetector(
              onTap: () async {
                const baseUrl = 'https://kamengkriti.onrender.com/';
                final list = [];

                for (var key in CartStore.cartItems.keys) {
                  list.add({
                    'item': CartStore.detail[key]['_id'],
                    'qty': CartStore.cartItems[key]
                  });
                }
                print(list);

                final prefs = await SharedPreferences.getInstance();
                final customerId =  prefs.getString('_id');

                final resp = await http.post(
                  Uri.parse('${baseUrl}api/order'),
                  headers: {"content-type": 'application/json'},
                  body: jsonEncode(
                    {
                      "customerId": customerId,
                      "shopkeeperId": widget.data['_id'],
                      "items": list,
                      "description": 'none'
                    },
                  ),
                );

                Navigator.of(context).pop();
                showSnackBar('Order Succesfully placed');
                print(resp.body);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 50,
                width: 200,
                child: Center(
                    child: Text(
                      'Place Order!',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageindex,
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Text(
            'Pay',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            var options = {
              'key': 'rzp_test_lH1Cp1gS0WSphU',
              'amount': 10000,
              'name': 'Kameng Corp.',
              'description': 'Fine T-Shirt',
              'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
            };
            _razorpay.open(options);
          }),
    );
  }
}
