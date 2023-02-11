import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/edit.png',height: 24,width: 24,),
          Text(
            'Edit',
            style: GoogleFonts.abyssinicaSil(color: Colors.white),
          )
        ],
      ),
    );
  }
}
