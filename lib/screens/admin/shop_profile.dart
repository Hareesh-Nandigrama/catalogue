import 'package:catalogue/screens/login/first_screen.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/admin/admin_card.dart';
import '../../widgets/login/button.dart';

class ShopKeeperDetails extends StatefulWidget {
  const ShopKeeperDetails({Key? key}) : super(key: key);

  @override
  State<ShopKeeperDetails> createState() => _ShopKeeperDetailsState();
}

class _ShopKeeperDetailsState extends State<ShopKeeperDetails> {

  TextEditingController _name = TextEditingController();
  TextEditingController _shopname = TextEditingController();
  String closesAt = 'Closes At';
  String opensAt = 'Opens At';
  String dropdownvalue = 'None';
  bool isDisabled = true;
  var items = [
    'None',
    'Khokha',
    'Core 1',
    'Core 2',
    'Core 3',
    'Core 4',
    'Core 5',
    'Manas',
    'Brahmaputra',
    'Kameng'
  ];

  String type = 'Food Outlet';
  setType(String x){
    setState(() {
      type = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Profile Page"),
        elevation: 0,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Image.asset(
                  'assets/beach.jpeg',
                  fit: BoxFit.cover,
                ),
              )),
          InField('Name', _name, 'a', 0),
          InField('Shop Name', _shopname, 'a', 0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      type = 'Food Outlet';
                    });
                  },
                  child: CategoryButton(
                    isDisabled: !(type == 'Food Outlet'),
                    shopCategory: 'Food Outlet',),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      type = 'Stationary';
                    });
                  },
                  child: CategoryButton(
                    isDisabled: !(type == 'Stationary'),
                    shopCategory: 'Stationary',),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      type = 'Other';
                    });
                  },
                  child: CategoryButton(
                    isDisabled: !(type == 'Other'),
                    shopCategory: 'Other',),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.location_on_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                          if (opensAt != 'Opens At' &&
                              closesAt != 'Closes At' &&
                              dropdownvalue != 'None') {
                            setState(() {
                              isDisabled = false;
                            });
                          } else {
                            isDisabled = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Outlet Location   ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(175, 175, 175, 1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          accentColor: Colors.black,
                          unselectedColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          barrierColor: Color.fromRGBO(0, 0, 0, 0.4),
                          context: context,
                          value: TimeOfDay.now(),
                          onChange: (value) {
                            setState(() {
                              opensAt = value.format(context);
                            });

                            if (opensAt != 'Opens At' &&
                                closesAt != 'Closes At' &&
                                dropdownvalue != 'None') {
                              setState(() {
                                isDisabled = false;
                              });
                            } else {
                              isDisabled = true;
                            }
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            opensAt,
                            style: TextStyle(
                                color: Color.fromRGBO(100, 100, 100, 1)),
                          ),
                          Icon(
                            Icons.access_time_filled,
                            color: Color.fromRGBO(100, 100, 100, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  '  -  ',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          accentColor: Colors.black,
                          unselectedColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          barrierColor: Color.fromRGBO(0, 0, 0, 0.4),
                          context: context,
                          value: TimeOfDay.now(),
                          onChange: (value) {
                            setState(() {
                              closesAt = value.format(context);
                            });

                            if (opensAt != 'Opens At' &&
                                closesAt != 'Closes At' &&
                                dropdownvalue != 'None') {
                              setState(() {
                                isDisabled = false;
                              });
                            } else {
                              isDisabled = true;
                            }
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            closesAt,
                            style: const TextStyle(
                                color: Color.fromRGBO(100, 100, 100, 1)),
                          ),
                          const Icon(
                            Icons.access_time_filled,
                            color: Color.fromRGBO(100, 100, 100, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(),),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 15),
            child: GestureDetector(
              onTap: () async {
                FirebaseAuth.instance.signOut();
                var pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FirstScreen()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_sharp, size: 25,color: Colors.red,),
                    Text('Logout', style: TextStyle(fontSize: 20, color: Colors.red),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}

class InField extends StatefulWidget {
  final text;
  final control;
  final type;
  final typo;
  InField(this.text, this.control, this.type, this.typo);
  @override
  _InFieldState createState() => _InFieldState(text,control,type,typo);
}
class _InFieldState extends State<InField> {
  late final text;
  late final control;
  late final type;
  late final typo;
  _InFieldState(this.text,this.control,this.type, this.typo);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 70,
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: control,
        obscureText: false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}