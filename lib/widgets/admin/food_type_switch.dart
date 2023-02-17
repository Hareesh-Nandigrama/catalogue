import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
class FoodTypeSwitch extends StatefulWidget {
  const FoodTypeSwitch({Key? key}) : super(key: key);

  @override
  State<FoodTypeSwitch> createState() => _FoodTypeSwitchState();
}

class _FoodTypeSwitchState extends State<FoodTypeSwitch> {
  bool online=false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width:102,
        height: 42,
        toggleSize: 24,
        borderRadius: 100,
        activeColor: const Color.fromRGBO(58, 167, 109, 1),
        inactiveColor: const Color.fromRGBO(212, 67, 51, 1),
        inactiveText: 'Non-Veg',
        inactiveTextColor: const Color.fromRGBO(238, 238, 238, 1),
        inactiveTextFontWeight: FontWeight.w500,
        valueFontSize: 12.82,
        padding: 8,
        activeText: 'Veg',
        activeTextColor: Colors.white,
        showOnOff: true,
        activeSwitchBorder: const Border(
        ),
        value: online,
        onToggle:(val){
          setState(() {
            online=val;
          });
        }
    );
  }
}