import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
class OnlineOfflineSwitch extends StatefulWidget {
  const OnlineOfflineSwitch({Key? key}) : super(key: key);

  @override
  State<OnlineOfflineSwitch> createState() => _OnlineOfflineSwitchState();
}

class _OnlineOfflineSwitchState extends State<OnlineOfflineSwitch> {
  bool online=false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width:96,
        height: 42,
        toggleSize: 24,
        borderRadius: 100,
        activeColor: const Color.fromRGBO(58, 167, 109, 1),
        inactiveColor: const Color.fromRGBO(238, 238, 238, 1),
        inactiveText: 'Offline',
        inactiveTextColor: const Color.fromRGBO(117, 117, 117, 1),
        inactiveTextFontWeight: FontWeight.w500,
        valueFontSize: 12.82,
        padding: 11,
        activeText: 'Online',
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