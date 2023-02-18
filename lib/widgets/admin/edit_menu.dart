import 'package:catalogue/widgets/admin/food_type_switch.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import '../login/button.dart';

class EditMenu extends StatefulWidget {
  const EditMenu({Key? key}) : super(key: key);

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  TextEditingController dishName = TextEditingController();
  TextEditingController dishPrice = TextEditingController();
  TextEditingController priceofDish = TextEditingController();

  String availableUntill = 'Untill';
  String availableFrom = 'From';
  var food_type = 'Veg';

  TextEditingController descriptionofDish = TextEditingController();
  bool _switchState = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 380,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16,),
          const Center(
            child: Text(
              'Edit Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16,),
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -132,
                      height: 45,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                        controller: dishName,
                        decoration: InputDecoration(
                          // suffixIcon: const ImageIcon(
                          //     AssetImage('assets/tick_mark.png',),
                          // ),
                          hintText: 'Dish',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(175, 175, 175, 1),
                          ),
                          labelText: "Dish",
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(175, 175, 175, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(175, 175, 175, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(175, 175, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                  ],
                );
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                    child:  Text(
                      'Availability time',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {


                      Navigator.of(context).push(
                        showPicker(
                          accentColor: Colors.black,
                          unselectedColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          barrierColor: const Color.fromRGBO(0, 0, 0, 0.4),
                          context: context,
                          value: TimeOfDay.now(),
                          onChange: (value) {
                            setState(() {
                              availableFrom=value.format(context);
                            });
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 140,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          Text(
                            availableFrom,
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
                  const SizedBox(
                    height: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          accentColor: Colors.black,
                          unselectedColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          barrierColor: const Color.fromRGBO(0, 0, 0, 0.4),
                          context: context,
                          value: TimeOfDay.now(),
                          onChange: (value) {
                            setState(() {
                              availableUntill=value.format(context);
                            });
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 140,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          Text(
                            availableUntill,
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
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                    child:  Text(
                      'Type',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  FoodTypeSwitch(
                    state: (val) {
                      food_type = val;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 132,
                    height: 45,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      controller: priceofDish,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(175, 175, 175, 1),
                        ),
                        labelText: "Price",
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(175, 175, 175, 1),
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(175, 175, 175, 1),
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(175, 175, 175, 1),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              controller: descriptionofDish,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(175, 175, 175, 1),
                ),
                labelText: "Description",
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(175, 175, 175, 1),
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(175, 175, 175, 1),
                    )),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(175, 175, 175, 1),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                },
                child: const CustomButton(
                    isDisabled: false, buttonname: 'Save Changes'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
