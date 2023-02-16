import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SummaryScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const SummaryScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(items: [1,2,3,4,5]
                        .map((item) => Container(
                      color: Colors.green,
                      child: Center(child: Text(item.toString())),
                    ))
                        .toList(), options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Hello, Roasted Pot',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 3,right: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Location:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(84, 84, 84, 1),
                                  ),
                                ),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  text: '   Khokha \n',
                                ),
                                TextSpan(
                                  text: 'Moneymaker:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(84, 84, 84, 1),
                                  ),
                                ),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  text: '  Chinmay\n',
                                ),
                                TextSpan(
                                  text: 'Contact No:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(84, 84, 84, 1),
                                  ),
                                ),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  text: '  1234567890',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CustomButton(
                        isDisabled: true,
                        buttonname: 'Skip for later',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const CustomButton(
                        isDisabled: false,
                        buttonname: 'Add Menu',
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Adding menu will attract more customers',
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(117, 117, 117, 1)),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.lightbulb,
                    color: Color.fromRGBO(117, 117, 117, 1),
                    size: 20,
                  ),
                  Text(
                    'Tip: More customers means more money!',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(117, 117, 117, 1)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
