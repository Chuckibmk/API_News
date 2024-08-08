import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
// import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController unctrl = TextEditingController();
  final TextEditingController ectrl = TextEditingController();
  final TextEditingController pwctrl = TextEditingController();
  final TextEditingController pw2ctrl = TextEditingController();

  @override
  void dispose() {
    unctrl.dispose();
    ectrl.dispose();
    pwctrl.dispose();
    pw2ctrl.dispose();
    super.dispose();
  }

  List<ButtonType> btn = [
    ButtonType.email,
    ButtonType.google,
    ButtonType.facebook,
    ButtonType.twitter,
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Username': unctrl,
      'Email': ectrl,
      'Password': pwctrl,
      'Repeat Password': pw2ctrl
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
              height: 70,
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
                  'Sign Up',
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
                  //Center(
                  //child:
                  Text(
                    'or Sign Up with',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //),
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
                  for (var x in btn)
                    SizedBox(
                      child: FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: x,
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
              child: const Center(
                child: Text(
                  'By signing up to Daily Trends, you are accepting our Terms & Conditions',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
