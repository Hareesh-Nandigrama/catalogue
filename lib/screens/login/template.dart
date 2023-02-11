import 'package:flutter/material.dart';
import 'dart:io';

class LoginTemplate extends StatefulWidget {
  final Widget body;
  const LoginTemplate({super.key, required this.body});

  @override
  State<LoginTemplate> createState() => _LoginTemplateState();
}

class _LoginTemplateState extends State<LoginTemplate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid,
      bottom: Platform.isAndroid,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/login_design_1.png'),
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/login_design_2.png'),
                ],
              ),
            ],
          ),
          widget.body,
        ]),
      ),
    );
  }
}
