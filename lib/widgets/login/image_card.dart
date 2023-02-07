import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final File? image;

  const ImageCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(1.5, 1.3),
      children: [
        DottedBorder(
          borderType: BorderType.Rect,
          color: image != null
              ? Colors.transparent
              : const Color.fromRGBO(175, 175, 175, 1),
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          dashPattern: const [6],
          padding: const EdgeInsets.all(0),
          radius: const Radius.circular(6),
          child: Container(
            height: 96,
            width: 72,
            decoration: BoxDecoration(
                image: image != null
                    ? DecorationImage(
                        image: FileImage(image!), fit: BoxFit.cover)
                    : null,
                color: const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
          ),
        ),
        Image.asset(
          image != null ? 'assets/edit.png' : 'assets/add.png',
          height: 30,
          width: 30,
        ),
      ],
    );
  }
}
