import 'package:catalogue/screens/login/add_photos.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

class TimingsScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const TimingsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TimingsScreen> createState() => _TimingsScreenState();
}

class _TimingsScreenState extends State<TimingsScreen> {
  TextEditingController opensAt = TextEditingController();
  TextEditingController closesAt = TextEditingController();
  TextEditingController location = TextEditingController();

  void _presentDatePicker() {}

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
              TextFormField(
                controller: location,
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Location',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
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
                    child: TextField(
                      enabled: false,
                      controller: opensAt,
                      decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          labelText: 'Open At',
                          filled: true,
                          fillColor: Color.fromRGBO(234, 234, 234, 1)),
                    ),
                  ),
                  const Text(
                    '  -  ',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                  ),
                  Expanded(
                    child: TextField(
                      controller: closesAt,
                      onTap: () async {
                        print('object');
                        await showTimePicker(
                    
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Colors.black,
                                  onPrimary: Colors.transparent,
                        
                          
                                  
                                ),
                                
                                
                                dialogBackgroundColor: Colors.white,
                              ),
                              child: child!,
                            );
                          },
                          
                          context: context, initialTime: TimeOfDay.now(),
                        
                        );
                      },
                      decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          labelText: 'Closes At',
                          filled: true,
                          fillColor: Color.fromRGBO(234, 234, 234, 1)),
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
                      widget.data['location'] = location.text;
                      widget.data['opens'] = opensAt.text;
                      widget.data['closes'] = closesAt.text;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => AddPhotos(
                            data: widget.data,
                          ),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isDisabled: false,
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
