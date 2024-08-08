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
    _cont.dispose();
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
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: QuillSimpleToolbar(
                                configurations:
                                    QuillSimpleToolbarConfigurations(
                                  controller: _cont,
                                  multiRowsDisplay: false,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: SizedBox(
                                child: QuillEditor.basic(
                                  configurations: QuillEditorConfigurations(
                                      controller: _cont,
                                      showCursor: true,
                                      maxHeight: 100,
                                      placeholder: 'Write Article'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          child: const Text(
                            'Post',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
