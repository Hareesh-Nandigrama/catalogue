import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isDisabled;
  final String buttonname;
  const CustomButton(
      {Key? key, required this.isDisabled, required this.buttonname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .420,
      height: 40,
      decoration: BoxDecoration(
        color: isDisabled ? const Color(0xffbebebe) : Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          buttonname,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isDisabled ? const Color(0xfffcfcfc) : Colors.white,
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final bool isDisabled;
  final String shopCategory;
  const CategoryButton(
      {Key? key, required this.isDisabled, required this.shopCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 12,
      height: 43,
      decoration: BoxDecoration(
        border: Border.all(
            color: isDisabled ? const Color(0xffbebebe) : Colors.black),
        color: isDisabled ? Colors.white : const Color(0xffbebebe),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.5, vertical: 8.5),
          child: Text(
            shopCategory,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDisabled ? const Color(0xffbebebe) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {

  final String buttonname;

  const CustomOutlinedButton({super.key, required this.buttonname});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .420,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          buttonname,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
