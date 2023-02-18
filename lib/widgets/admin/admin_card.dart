import 'package:catalogue/widgets/admin/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AdminCard extends StatefulWidget {
  final data;
  const AdminCard({super.key, this.data});

  @override
  State<AdminCard> createState() => _AdminCardState();
}

class _AdminCardState extends State<AdminCard> {
  String phone = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    function();
  }

  function() async {
    final prefs = await SharedPreferences.getInstance();
     phone = prefs.getString('phone') ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 33),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 100,
            spreadRadius: 0.1,
            offset: Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding:
                const EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Hello, ${widget.data['businessName']}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Location:',
                              style: TextStyle(
                                  color: Color.fromRGBO(84, 84, 84, 1),
                                  height: 1.6),
                            ),
                            TextSpan(
                              text: '     ${widget.data['location']}',
                              style: TextStyle(
                                  color: Colors.black, height: 1.6),
                            ),
                          ]),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'MoneyMaker:',
                              style: TextStyle(
                                  color: Color.fromRGBO(84, 84, 84, 1),
                                  height: 1.6),
                            ),
                            TextSpan(
                              text: '   ${widget.data['username']}',
                              style: TextStyle(
                                  color: Colors.black, height: 1.6),
                            ),
                          ]),
                        ),
                        RichText(
                          text:  TextSpan(children: [
                            TextSpan(
                              text: 'Contact No:'+phone,
                              style: TextStyle(
                                  color: Color.fromRGBO(84, 84, 84, 1),
                                  height: 1.6),
                            ),
                            TextSpan(
                              text: '  ',
                              style: TextStyle(
                                  color: Colors.black, height: 1.6),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    //const EditButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
