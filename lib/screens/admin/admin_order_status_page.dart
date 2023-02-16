import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const AdminOrderStatus());
}
class AdminOrderStatus extends StatefulWidget {
  const AdminOrderStatus({super.key});

  @override
  State<AdminOrderStatus> createState() => _AdminOrderStatusState();
}

class _AdminOrderStatusState extends State<AdminOrderStatus> with TickerProviderStateMixin  {
  bool _switchState = false;
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 3, vsync:this );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(226, 226, 226, 1), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoSwitch(
                      activeColor: Colors.green,
                      value: _switchState,
                      onChanged: (value) {
                        setState(() {
                          _switchState = !_switchState;
                        });
                      },
                    ),
                    Row(
                      children:  [
                        const Text('Roasted Pot',
                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor:  Colors.black,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor:  Colors.white,


                            child: Image.asset(
                              'assets/profile.png',
                              height: 18,
                              width: 18,
                            ),
                          ),
                          // backgroundImage: AssetImage('assets/profile.png'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: tabController,
                tabs: const <Widget>[
                  Tab(
                      child: Text('Requests(0)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                  Tab(
                      child: Text('Preparing(0)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                  Tab(
                      child: Text('Ready(0)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),)
                  ),
                ],

              ),
              const Spacer(),
              Image.asset(
                'assets/baker.png',
                height: 136,
                width: 136,
              ),
             const  Text('No Ongoing Orders',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              const Text(
                'Hold Still a Customer will soon order from your\n                   restaurant',
                style: TextStyle(fontSize: 14,color:  Color.fromRGBO(117, 117, 117, 1)),
              ),
              const SizedBox(height: 24,),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 2,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(84, 84, 84, 1),
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        items:  [
          BottomNavigationBarItem(icon: Image.asset('assets/Food.png'), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/Stationary.png'), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/Others.png'), label: 'Insights'),
        ],
      ),
    );
  }
}