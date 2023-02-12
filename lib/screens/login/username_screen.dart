import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

import 'business_screen.dart';
class UsernameScreen extends StatefulWidget {

  const UsernameScreen({Key? key, }) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController usersName = TextEditingController();
  bool disabled=true;
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'What shall we call you?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  onTap: () {

                  },
                  onChanged: (value){
                    usersName.text=value;
                    if( usersName.text.isNotEmpty){
                      setState(() {
                        disabled=false;
                      });
                    }else{
                      setState(() {
                        disabled=true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    // suffixIcon: const ImageIcon(
                    //     AssetImage('assets/tick_mark.png',),
                    // ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(175, 175, 175, 1),
                    ),
                    labelText: "Name",
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
              GestureDetector(
                onTap: (){
                  if(usersName.text.isNotEmpty){
                    Map<String, dynamic> data = {};
                    data['username'] = usersName.text;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context)=> BuisnessNameScreen(
                          data: data
                        ))
                    );
                  }else{
                    disabled=true;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.black
                          ),),
                          content: const Text('Please Enter Your name'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK',style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22,
                                  color: Colors.black
                              ),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child:  CustomButton(
                  isDisabled: disabled,
                  buttonname: 'Next',
                ),
              ),
            ],
          ),

    );
  }
}
