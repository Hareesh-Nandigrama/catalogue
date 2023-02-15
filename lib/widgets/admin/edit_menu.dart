import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/button.dart';
void main(){
  runApp( MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.grey
    ),
    home: const Scaffold(
      body: EditMenu(),
    ),
  ));
}
class EditMenu extends StatefulWidget {
  const EditMenu({Key? key}) : super(key: key);

  @override
  State<EditMenu> createState() => _EditMenuState();
}
class _EditMenuState extends State<EditMenu> {
  TextEditingController dishName = TextEditingController();
  TextEditingController dishPrice = TextEditingController();
  TextEditingController availableFrom = TextEditingController();
  TextEditingController availableTill = TextEditingController();
  TextEditingController descriptionofDish=TextEditingController();
  bool _switchState=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
          height: 300,
          width: double.infinity,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
                color: Colors.black,
                width: 1
            ),
          ),
          child: Column(
            children:  [
              const Padding(
                padding: EdgeInsets.only(top: 8,bottom: 8),
                child: Center(
                  child: Text('Edit Menu',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width-180,
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
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(175, 175, 175, 1),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: SizedBox(
                        width: 120,
                        height: 45,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          controller: dishPrice,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.currency_rupee,color: Colors.black,size: 18,),
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
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(175, 175, 175, 1),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 22,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Availability time',style: TextStyle(color: Colors.grey),),
                    Text('Type',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width/4.5,
                    child: TextField(
                      controller: availableFrom,
                      onTap: () async {
                        TimeOfDay? time =TimeOfDay.now();
                        FocusScope.of(context).requestFocus(FocusNode());
                        time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                        if(!mounted)return;
                        availableFrom.text=time!.format(context);
                      },

                      decoration: InputDecoration(
                        hintText: 'Available from',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(175, 175, 175, 1),
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
                  const Text('-',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 32),),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width/4.5,
                    child: TextFormField(
                      controller: availableTill,
                      onTap: () async {
                        TimeOfDay? time =TimeOfDay.now();
                        FocusScope.of(context).requestFocus(FocusNode());
                        time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                        if(!mounted)return;
                        availableTill.text=time!.format(context);
                      },
                      decoration: InputDecoration(

                        // suffixIcon: const ImageIcon(
                        //     AssetImage('assets/tick_mark.png',),
                        // ),
                        hintText: 'Available till',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(175, 175, 175, 1),
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
                  CupertinoSwitch(
                    activeColor: Colors.green,
                    trackColor: Colors.red,
                    value: _switchState,
                    onChanged: (value) {
                      setState(() {
                        _switchState = !_switchState;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,top: 14,right: 16),
                child: SizedBox(
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
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(175, 175, 175, 1),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,top: 18,right: 16,bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomOutlinedButton(buttonname: 'Delete Item'),
                    CustomButton(isDisabled: false, buttonname: 'Save Changes')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}