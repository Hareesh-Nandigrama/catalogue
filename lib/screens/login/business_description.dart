import 'package:catalogue/screens/login/business_type_screen.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';

class BusinessDescriptionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const BusinessDescriptionScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<BusinessDescriptionScreen> createState() => _BusinessNameDescriptionState();
}

class _BusinessDescriptionScreenState extends State<BusinessDescriptionScreen> {
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.data['username'] + ' proudly manages',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              controller: description,
              decoration: InputDecoration(
                // suffixIcon: const ImageIcon(
                //     AssetImage('assets/tick_mark.png',),
                // ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
                    if (description.text.isNotEmpty) {
                      Map<String, dynamic> data = widget.data;
                      data['businessName'] = description.text;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BusinessTypeScreen(data: data),
                        ),
                      );
                    }
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
    );
  }
}
