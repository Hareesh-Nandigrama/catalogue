import 'package:flutter/material.dart';

class CustomerSearchBar extends StatelessWidget {
  const CustomerSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      cursorColor: const Color.fromRGBO(140, 142, 151, 1),
      decoration: const InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        fillColor: Color.fromRGBO(226, 226, 226, 1),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Color.fromRGBO(140, 142, 151, 1),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
