import 'package:catalogue/screens/customer/customer_profile.dart';
import 'package:catalogue/widgets/customer/customer_card.dart';
import 'package:catalogue/widgets/customer/search_bar.dart';
import 'package:flutter/material.dart';

class ShopItems extends StatefulWidget {
  final data;
  const ShopItems({super.key, required this.data});

  @override
  State<ShopItems> createState() => _ShopItemsState();
}

class _ShopItemsState extends State<ShopItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    List<dynamic> renderList = widget.data;
    var filteredList = [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Color.fromRGBO(226, 226, 226, 1), width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomerSearchBar(callback: (val) {
                  setState(() {
                    filteredList = renderList.where((element) {
                      String ac = element['businessName'];
                      String contain = val;
                      print('fjkhsjhdgfshjds');
                      print(ac);
                      print(ac.contains(val));
                      return ac.contains(contain.toLowerCase());
                    }).toList();
                    print(filteredList);

                    print(val);
                    // filteredList = renderList.where((element) {
                    //   String string = body['businessName'];
                    //   return string.contains(val);
                    // })
                  });
                }),
              ),
              const SizedBox(
                width: 14,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CustomerProfile(),
                  ));
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromRGBO(226, 226, 226, 1),
                  child: Image.asset(
                    'assets/profile.png',
                    height: 25,
                    width: 25,
                  ),
                  // backgroundImage: AssetImage('assets/profile.png'),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return CustomerCard(
                  body: filteredList[index],
                );
              }),
        )
      ],
    );
  }
}
