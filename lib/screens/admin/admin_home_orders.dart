import 'package:catalogue/screens/admin/admin_orders/preparing.dart';
import 'package:catalogue/screens/admin/admin_orders/requests.dart';
import 'package:catalogue/screens/login/first_screen.dart';
import 'package:flutter/material.dart';

class AdminHomeOrders extends StatefulWidget {
  const AdminHomeOrders({super.key});

  @override
  State<AdminHomeOrders> createState() => _AdminHomeOrdersState();
}

class _AdminHomeOrdersState extends State<AdminHomeOrders>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.black,
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                  child: Text(
                'Requests(0)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
              Tab(
                  child: Text(
                'Preparing(0)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
              Tab(
                  child: Text(
                'Ready(0)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              Requests(),
              Preparing(),
              FirstScreen()
            ],
          ))
        ],
      ),
    );
  }
}
