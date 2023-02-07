import 'package:catalogue/screens/login/timings_screen.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
class BuisnessTypeScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const BuisnessTypeScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<BuisnessTypeScreen> createState() => _BuisnessTypeScreenState();
}

class _BuisnessTypeScreenState extends State<BuisnessTypeScreen> {
  String type = 'Food Outlet';
  setType(String x){
    setState(() {
      type = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  widget.data['buisnessName'],
                  style: const TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'is a',
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
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: const CustomButton(
                          isDisabled: false,
                          buttonname: 'Previous',
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Map<String, dynamic> data = widget.data;
                          data['type'] = type;
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context)=> TimingsScreen(
                                data: data
                              ))
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
