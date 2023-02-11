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

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.data['buisnessName'],
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Text(
              'at',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                onTap: () {},
                onChanged: (value) {

                },
                decoration: InputDecoration(
                  // suffixIcon: const ImageIcon(
                  //     AssetImage('assets/tick_mark.png',),
                  // ),
                  hintText: 'Location',
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
            const SizedBox(
              height: 12,
            ),
            const Text(
              'is usually open from',
              style: TextStyle(
                fontSize: 28,
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
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width/2.4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      controller: opensAt,
                      onTap: () async {
                        TimeOfDay? time =TimeOfDay.now();
                        FocusScope.of(context).requestFocus(FocusNode());
                        time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                        if(!mounted) return;
                        opensAt.text=time!.format(context);
                      },

                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: const Icon(
                            Icons.access_time_filled
                          ),
                        ),
                        hintText: 'Opens at',
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
                ),
                const Text('-',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 32),),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width/2.4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16,),
                    child: TextFormField(
                      controller: closesAt,
                      onTap: () async {
                        TimeOfDay? time =TimeOfDay.now();
                        FocusScope.of(context).requestFocus(FocusNode());
                        time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                        if(!mounted) return;
                        closesAt.text=time!.format(context);
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                            Icons.access_time_filled
                        ),
                        // suffixIcon: const ImageIcon(
                        //     AssetImage('assets/tick_mark.png',),
                        // ),
                        hintText: 'Closes at',
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
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CustomButton(
                      isDisabled: false,
                      buttonname: 'Previous',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context)=> const AddPhotos())
                      );
                    },
                    child: const CustomButton(
                      isDisabled: false,
                      buttonname: 'Next',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
