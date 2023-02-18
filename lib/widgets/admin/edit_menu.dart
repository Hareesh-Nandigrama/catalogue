import 'package:catalogue/apis/seller.dart';
import 'package:catalogue/widgets/admin/food_type_switch.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/button.dart';

class EditMenu extends StatefulWidget {
  final dynamic data;
  const EditMenu({Key? key, this.data}) : super(key: key);

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  String dishName = '';

  String priceofDish = '';

  String availableUntill = 'Untill';
  String availableFrom = 'From';
  String food_type = 'Non Veg';

  String descriptionofDish = '';
  bool _isDisabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.data != null)
      {
        dishName = widget.data!['name'];
        priceofDish = widget.data!['price'].toString();

        availableUntill = widget.data!['endTime'].toString();
        availableFrom = widget.data!['startTime'].toString();
        food_type = widget.data!['type'];
        descriptionofDish = widget.data!['description'];
        setState(() {
          _isDisabled = false;
        });
      }


  }

  void check() {


    if (dishName.isEmpty ||
        priceofDish.isEmpty ||
        descriptionofDish.isEmpty ||
        availableUntill == 'Untill' ||
        availableFrom == 'From') {
      setState(() {
        _isDisabled = true;
      });
    } else {
      setState(() {
        _isDisabled = false;
      });
    }
  }

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
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              'Edit Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 138,
                      height: 45,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        initialValue: dishName,
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          dishName = val;
                          check();
                        },
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
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
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
                            check();
                            setState(() {
                              availableFrom = value.format(context);
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
                        children: [
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
                            check();
                            setState(() {
                              availableUntill = value.format(context);
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
                        children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
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
                      onChanged: (value) => {
                        priceofDish = value,
                        check(),
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      initialValue: priceofDish,
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
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: TextFormField(
              onChanged: (value) => {
                descriptionofDish = value,
                check(),
              },
              cursorColor: Colors.black,
              initialValue: descriptionofDish,
              keyboardType: TextInputType.name,
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
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {

                  if (_isDisabled) return;

                  final prefs = await SharedPreferences.getInstance();
                  final id = prefs.getString('_id') ?? '';

                  if(widget.data != null)
                    {
                      await editMenu(dishName, priceofDish, food_type, id, ' ',
                          descriptionofDish,availableFrom,availableUntill, widget.data['_id']);
                    }
                  else
                    {
                      await createMenu(dishName, priceofDish, food_type, id, ' ',
                          descriptionofDish,availableFrom,availableUntill);
                    }


                  Navigator.of(context).pop();
                },
                child: CustomButton(
                    isDisabled: _isDisabled, buttonname: 'Save Changes'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
