import 'dart:io';

import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final TextEditingController hdctrl = TextEditingController();
  final TextEditingController tgctrl = TextEditingController();
  final TextEditingController ctctrl = TextEditingController();

  @override
  void dispose() {
    hdctrl.dispose();
    tgctrl.dispose();
    ctctrl.dispose();
    super.dispose();
  }

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

  QuillController _cont = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Add Heading': hdctrl,
      'Add Tag': tgctrl,
      'Category': ctctrl
    };
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
                ),
                Form(
                  child: Column(
                    children: [
                      for (var a in fom.keys)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  // contentPadding: const EdgeInsets.all(10),
                                  labelText: a,
                                ),
                                controller: fom[a],
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      QuillSimpleToolbar(
                          configurations: QuillSimpleToolbarConfigurations(
                              controller: _cont)),
                      Expanded(
                          child: QuillEditor.basic(
                              configurations:
                                  QuillEditorConfigurations(controller: _cont)))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
