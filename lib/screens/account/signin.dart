import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

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

  List<IconData> icn = [
    Icons.mail_outline,
    Icons.mail_outline,
    Icons.mail_outline,
    Icons.mail_outline,
  ];

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
                      margin: const EdgeInsets.symmetric(vertical: 10),
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
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Sign In')),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 15),
                  //   child: Divider(
                  //     indent: 20,
                  //     endIndent: 0,
                  //     height: 1,
                  //     thickness: 1,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  Text(
                    'or Sign in with',
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
                      child: Icon(x),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
