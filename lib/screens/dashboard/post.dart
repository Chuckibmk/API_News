import 'dart:io';

import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  ImagePicker picker = ImagePicker();
  var _image;

  void pickImage() async {
    var xfile = await picker.pickImage(source: ImageSource.gallery);
    // Pick singe image or video.
    // final XFile? media = await picker.pickMedia();

    setState(() {
      _image = File(xfile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (context) => const Dashboard());
                      Navigator.push(context, route);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: _image != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(_image!),
                        )
                      : CircleAvatar(
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: Icon(Icons.camera),
                          ),
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
