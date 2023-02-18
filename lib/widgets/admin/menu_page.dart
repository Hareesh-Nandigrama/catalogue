import 'package:catalogue/apis/seller.dart';
import 'package:catalogue/widgets/admin/edit_menu.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import '../../screens/customer/customer_profile.dart';
import 'menu_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void func()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  'assets/nonvegicon.png',
                  height: 26.73,
                  width: 106.73,
                ),
              ),
              Image.asset(
                'assets/vegicon.png',
                height: 26.73,
                width: 79.63,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
                future: getMenu(),
                builder: (context, snapshot) {
                  if (snapshot.data == ConnectionState.waiting) {
                    return Text('adssd');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) => MenuCard(
                        data: snapshot.data[index],
                        callback: func,
                      ),
                      itemCount: snapshot.data!.length,
                    );
                  } else {
                    return CustomProgress();
                    // return CustomProgress();
                  }
                }),
          ),

          // EditMenu(),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.all(10),
                      child: EditMenu()),
                );
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 32,
                child: Icon(Icons.add),
              ))
        ],
      ),
    );
  }
}

class NoMenu extends StatelessWidget {
  const NoMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Container(),
              ),
              const SizedBox(
                width: 14,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CustomerProfile(),
                  ))
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
        const Spacer(),
        Image.asset(
          'assets/outlet.png',
          height: 136,
          width: 136,
        ),
        const Text(
          'No Outlets Available',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          'We couldn\'t find any shops nearby!',
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
        ),
        const SizedBox(
          height: 24,
        ),
        const CustomButton(isDisabled: false, buttonname: 'Try Again!'),
        const Spacer(),
      ],
    );
  }
}
