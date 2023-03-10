import 'dart:io';

import 'package:catalogue/apis/images.dart';
import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/screens/admin/admin_splash.dart';
import 'package:catalogue/screens/login/template.dart';
import 'package:catalogue/widgets/common/custom_progress.dart';
import 'package:catalogue/widgets/login/button.dart';
import 'package:catalogue/widgets/login/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotos extends StatefulWidget {
  final data;

  const AddPhotos({super.key, required this.data});

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  bool isLoading = false;
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  bool isDisabled = true;

  Future getImage(int a) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      switch (a) {
        case 1:
          setState(() {
            _image1 = imageTemporary;
          });
          break;
        case 2:
          setState(() {
            _image2 = imageTemporary;
          });
          break;
        case 3:
          setState(() {
            _image3 = imageTemporary;
          });
          break;
        case 4:
          setState(() {
            _image4 = imageTemporary;
          });
          break;

        default:
      }
      int ct = 0;
      if (_image1 != null) ct++;
      if (_image2 != null) ct++;
      if (_image3 != null) ct++;
      if (_image4 != null) ct++;

      if (ct >= 2) {
        setState(() {
          isDisabled = false;
        });
      }
    } on PlatformException catch (e) {
      print(e);
      //TODO: Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
        body: Center(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Add Photos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Add at least two photos to continue",
                style: TextStyle(
                  fontSize: 14.23,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(1);
                        },
                        child: ImageCard(image: _image1),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage(2);
                        },
                        child: ImageCard(image: _image2),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage(3);
                        },
                        child: ImageCard(image: _image3),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage(4);
                        },
                        child: ImageCard(image: _image4),
                      ),
                    ],
                  )),
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
                      onTap: () async {
                        if (isDisabled) return;

                        List<String> photos = [];

                        setState(() {
                          isLoading = true;
                        });

                        if (_image1 != null) {
                          final photo = await uploadImage(_image1!);
                          photos.add(photo);
                        }
                        if (_image2 != null) {
                          final photo = await uploadImage(_image2!);
                          photos.add(photo);
                        }
                        if (_image3 != null) {
                          final photo = await uploadImage(_image3!);
                          photos.add(photo);
                        }
                        if (_image4 != null) {
                          final photo = await uploadImage(_image4!);
                          photos.add(photo);
                        }

                        widget.data['photos'] = photos;
                        showSnackBar('Photos successfully uploaded');

                        if (!mounted) return;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AdminSplash(data: widget.data),
                          ),
                        );
                      },
                      child: CustomButton(
                        isDisabled: isDisabled,
                        buttonname: 'Next',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(visible: isLoading, child: CustomProgress())
        ],
      ),
    ));
  }
}
