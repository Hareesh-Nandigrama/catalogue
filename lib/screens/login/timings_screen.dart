import 'package:catalogue/screens/login/add_photos.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class TimingsScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const TimingsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TimingsScreen> createState() => _TimingsScreenState();
}

class _TimingsScreenState extends State<TimingsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.data['businessName'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Text(
                'at',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromRGBO(175, 175, 175, 1), width: 1),
                ),
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
              const SizedBox(
                height: 12,
              ),
              const Text(
                'is usually open from',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
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
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CustomOutlinedButton(
                      buttonname: 'Previous',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isDisabled) return;
                      widget.data['location'] = dropdownvalue;
                      widget.data['opens'] = opensAt;
                      widget.data['closes'] = closesAt;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddPhotos(
                            data: widget.data,
                          ),
                        ),
                      );
                    },
                    child: CustomButton(
                      isDisabled: isDisabled,
                      buttonname: 'Next',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
