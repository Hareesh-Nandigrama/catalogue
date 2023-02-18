// import 'package:catalogue/screens/customer/cart_store.dart';
// import 'package:flutter/material.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     print('Printing cart details');
//     print(CartStore.cartItems);

//     return Column(
//       children: [
//         SizedBox(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               ListView.builder(
//                 itemBuilder: (context, index) =>
//                 ),
//                 itemCount: CartStore.detail.length,
//               )
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(color: Colors.black),
//           width: double.infinity,
//           height: 60,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Container(
//             color: Colors.black,
//             child: const Text(
//               'Place here!',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
