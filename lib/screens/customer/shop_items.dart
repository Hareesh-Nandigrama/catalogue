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
  Widget build(BuildContext context) {
    final renderList = widget.data;

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
                    renderList.retainWhere((element) {
                      String name = element['businessName'];

                      return name.contains(val);
                    });
                  });
                }),
              ),
              const SizedBox(
                width: 14,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CustomerProfile()));
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
              itemCount: renderList.length,
              itemBuilder: (context, index) {
                return CustomerCard(
                  body: renderList[index],
                );
              }),
        )
      ],
    );
  }
}
