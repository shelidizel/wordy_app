import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordy_app/core/wordy_theme.dart';
import 'package:wordy_app/models/user.dart';
import 'package:wordy_app/presentation/screens/info_screen.dart';
import 'dart:io' as i;

class DesignScreen extends StatefulWidget {
  DesignScreen({Key? key}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  String _name = '';
  String _email = '';
  String _phone = '';

  XFile? imageFile;
  XFile? profileimage;

  @override
  void initState() {
    getUser().then(updateUser);
    super.initState();
  }

  _getFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800,
    );
    if (image != null) {
      setState(() {
        imageFile = image;
      });
    }
  }

  _showImage() {
    if (imageFile == null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width - 80,
          color: WordyTheme.light().colorScheme.secondary,
          child: const Padding(
            padding: EdgeInsets.all(100.0),
            child: Text(
              'Upload a profile picture',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    } else if (imageFile != null) {
      print('showing image from local file');

      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 240,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Image.file(
                i.File(imageFile!.path),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width - 80,
              ),
              const ElevatedButton(
                child: Text(
                  'Change Image',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: null,
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget profileImage() {
      if (profileimage != null) {
        return CircleAvatar(
          radius: 42,
          backgroundImage: FileImage(
            i.File(profileimage!.path),
          ),
        );
      }
      return CircleAvatar(
        radius: 42,
        backgroundColor: WordyTheme.light().colorScheme.secondary,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Design'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 5,
                shadowColor: Colors.grey.withOpacity(0.2),
                child: Container(
                  color: Colors.white,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      profileImage(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color:  Color(0xff373636),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Name:  ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding:const  EdgeInsets.all(2.0),
                            child: Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff373636),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Email:  ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _email,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color:  Color(0xff373636),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Phone Number:  ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _phone,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            PhysicalModel(
              color: Colors.white,
              shadowColor: Colors.grey.withOpacity(0.2),
              child: SizedBox(
                height: 320,
                width: MediaQuery.of(context).size.width - 20,
                child: Container(
                  child: Column(
                    children: [
                      _showImage(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 146,
                                child: ElevatedButton(
                                    onPressed: () {
                                      _getFromGallery();
                                    },
                                    child: Text('Upload pic'))),
                            SizedBox(
                                width: 146,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        profileimage = imageFile;
                                        SnackBar snackBar =const  SnackBar(
                                            content: Text(
                                                'profile image added succesfully'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      });
                                    },
                                    child: const Text('Save picture'))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  updateUser(User user) {
    setState(() {
      _name = user.name!;
      _email = user.email!;
      _phone = user.phoneNumber!;
    });
  }
}
