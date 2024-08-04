import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController unctrl = TextEditingController();
  final TextEditingController pwctrl = TextEditingController();

  @override
  void dispose() {
    unctrl.dispose();
    pwctrl.dispose();
    super.dispose();
  }

  List<IconData> icn = [
    Icons.mail_outline,
    Icons.mail_outline,
    Icons.mail_outline,
    Icons.mail_outline,
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Username or Email': unctrl,
      'Password': pwctrl
    };
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.zero,
                ),
                child: Image.asset(
                  'assets/logo/DT_Logo.png',
                  fit: BoxFit.fill,
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
                          margin: const EdgeInsets.symmetric(vertical: 10),
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
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 15),
                  //   child: const Divider(
                  //     indent: 20,
                  //     endIndent: 0,
                  //     height: 1,
                  //     thickness: 5,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  Center(
                    child: Text(
                      'or Sign in with',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Divider(
                  //   // indent: 57,
                  //   height: 1,
                  //   thickness: 1,
                  //   color: Colors.black54,
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var x in icn)
                    Card(
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(x),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    " Register",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
