import 'dart:io';

import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  final TextEditingController usctrl = TextEditingController();
  final TextEditingController fnctrl = TextEditingController();
  final TextEditingController ltctrl = TextEditingController();
  final TextEditingController emctrl = TextEditingController();
  final TextEditingController pwctrl = TextEditingController();

  @override
  void dispose() {
    usctrl.dispose();
    fnctrl.dispose();
    ltctrl.dispose();
    emctrl.dispose();
    pwctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Username': usctrl,
      'Firstname': fnctrl,
      'Lastname': ltctrl,
      'Email': emctrl,
      'Password': pwctrl
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
                          // backgroundImage: AssetImage,
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: const Icon(Icons.person),
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
                      // Center(
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     style: ButtonStyle(
                      //         shape: MaterialStateProperty.all<
                      //             RoundedRectangleBorder>(
                      //           RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //             side: BorderSide(
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .onSurface),
                      //           ),
                      //         ),
                      //         backgroundColor:
                      //             MaterialStateProperty.all(Colors.blue)),
                      //     child: const Text(
                      //       'Post',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
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
