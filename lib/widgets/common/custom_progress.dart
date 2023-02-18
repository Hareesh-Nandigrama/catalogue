import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      child: Center(
        child: SizedBox(
          width: 100,
          child: const LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
