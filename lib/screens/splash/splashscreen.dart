import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:api_news/routes/app/app-route-names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff001F3F),
        child: Center(
          child: Image.asset('assets/logo/DT_logo.png'),
        ),
      ),
    );
  }
}
