
import 'package:catalogue/screens/customer/customer_orders/pending_payment.dart';
import 'package:catalogue/screens/customer/customer_orders/preparing.dart';
import 'package:catalogue/screens/login/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
              icon: Icon(
                Icons.logout_sharp,
                color: Colors.red,
              )),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            indicatorColor: Colors.black,
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                  child: Text(
                    'Awaiting Payment',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
              Tab(
                  child: Text(
                    'Pending Pick-up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [CustomerPreparing(), PendingPayment()],
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }
}
