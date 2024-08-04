import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController emctrl = TextEditingController();
  final TextEditingController otpctrl = TextEditingController();

  @override
  void dispose() {
    emctrl.dispose();
    otpctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> fom = {
      'Email': emctrl,
      'Verification OTP': otpctrl
    };
    return Scaffold(
      body: SingleChildScrollView(
        // height: double.infinity,
        // width: double.infinity,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(10),
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
                              labelText: a,
                              // if(a == 'Email'){
                              suffix: getSuffix(a),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text(
                        'Verify',
                        style: TextStyle(color: Colors.white),
                      ),
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

  getSuffix(String i) {
    if (i == 'Email') {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        child: const Text(
          'Send OTP',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return null;
    }
  }
}
