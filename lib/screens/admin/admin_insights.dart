import 'package:catalogue/screens/admin/admin_orders/cancelled.dart';
import 'package:catalogue/screens/admin/admin_orders/delievered.dart';
import 'package:catalogue/screens/admin/admin_orders/preparing.dart';
import 'package:catalogue/screens/admin/admin_orders/requests.dart';
import 'package:flutter/material.dart';

class AdminHomeInsights extends StatefulWidget {
  const AdminHomeInsights({super.key});

  @override
  State<AdminHomeInsights> createState() => _AdminHomeInsightsState();
}

class _AdminHomeInsightsState extends State<AdminHomeInsights>
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
    return Expanded(
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.black,
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                  child: Text(
                    'Delievered',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
              Tab(
                  child: Text(
                    'Cancelled',
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
                  Delievered(),
                  Cancelled(),
                ],
              ))
        ],
      ),
    );
  }
}
