import 'package:catalogue/apis/orders.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/login/button.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class Unpaid extends StatefulWidget {
  final data;
  const Unpaid({Key? key, this.data}) : super(key: key);

  @override
  State<Unpaid> createState() => _UnpaidState();
}

class _UnpaidState extends State<Unpaid> {
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
    num answer = 0;
    for (var item in widget.data['items']) {
      answer += item['qty'] * item['item']['price'];
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      //height: 266,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        'Order id: ' +
                            widget.data['_id'].toString().substring(0, 5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Text(
                          widget.data['createdAt'].toString().substring(0, 10)),
                      Icon(Icons.more_vert_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('User Id:' + widget.data['customerId']),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 8),
                //   child: Row(
                //     children: const [
                //       Text('11th order'),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          for (var item in widget.data['items'])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/Veg.png'),
                          height: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child:
                              Text('${item['item']['name']} x${item['qty']}'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          size: 14,
                        ),
                        Text('${item['qty'] * item['item']['price']}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Total'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 14,
                      ),
                      Text(answer.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          widget.data['status'] == 'pending'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            await declinePendingOrder(widget.data['_id']);
                          },
                          child: CustomButtonAcceptOrDeny(
                              accepted: false, buttonname: 'Decline')),
                      GestureDetector(
                          onTap: () async {
                            await acceptPendingOrder(widget.data['_id']);
                          },
                          child: CustomButtonAcceptOrDeny(
                              accepted: true, buttonname: 'Accept')),
                    ],
                  ),
                )
              : widget.data['status'] == 'accepted'
                  ? GestureDetector(
                      onTap: () async {
                        await orderReady(widget.data['_id']);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomButton(
                              isDisabled: false, buttonname: 'Order Ready'),
                        ],
                      ),
                    )
                  : widget.data['status'] == 'completed'
                      ? GestureDetector(
                          onTap: () async {
                            await orderReady(widget.data['_id']);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomButton(
                                  isDisabled: false, buttonname: 'Delievered'),
                            ],
                          ),
                        )
                      : widget.data['status'] == 'delivered'
                          ? Container()
                          : GestureDetector(
                              onTap: () async {
                                const baseUrl =
                                    'https://kamengkriti.onrender.com/';

                                final prefs =
                                    await SharedPreferences.getInstance();
                                final customerName = prefs.getString('uid');
                                print(customerName);

                                final res = await http.post(
                                    Uri.parse(
                                      '${baseUrl}api/customer/accept/${widget.data['_id']}',
                                    ),
                                    headers: {
                                      "Authorizations": "Token $customerName"
                                    });
                                print('PRINTING ress');
                                print(res.body);

                                var options = {
                                  'key': 'rzp_test_lH1Cp1gS0WSphU',
                                  'amount': 10000,
                                  'name': 'Kameng Corp.',
                                  'description': 'Fine T-Shirt',
                                  'prefill': {
                                    'contact': '8888888888',
                                    'email': 'test@razorpay.com'
                                  }
                                };
                                _razorpay.open(options);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 22,
                                  child: Text(
                                    'Pay',
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

class CustomButtonAcceptOrDeny extends StatelessWidget {
  final bool accepted;
  final String buttonname;
  const CustomButtonAcceptOrDeny(
      {Key? key, required this.accepted, required this.buttonname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .420,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: accepted ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonname,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: accepted ? Colors.green : Colors.red,
              ),
            ),
            accepted
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(Icons.clear, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
