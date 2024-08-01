import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController unctrl = TextEditingController();
  final TextEditingController ectrl = TextEditingController();
  final TextEditingController pwctrl = TextEditingController();

  @override
  void dispose() {
    unctrl.dispose();
    ectrl.dispose();
    pwctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Username': unctrl,
      'Email': ectrl,
      'Password': pwctrl
    };
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        child: Center(
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
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    for (var a in fom.keys)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.all(10),
                            hintText: a,
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
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(onPressed: () {}, child: Text('Sign In')),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Divider(
                  //   // indent: 57,
                  //   height: 1,
                  //   thickness: 1,
                  //   color: Colors.black54,
                  // ),
                  RichText(
                      text: TextSpan(
                    text: 'or Sign in with',
                  )),
                  // const Divider(
                  //   // indent: 57,
                  //   height: 1,
                  //   thickness: 1,
                  //   color: Colors.black54,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
