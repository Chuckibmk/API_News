import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'routes/app/app-route.dart';
import 'routes/app/app-route-names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Trends',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff001F3F)),
        useMaterial3: true,
      ),
      initialRoute: splash,
      getPages: getPage,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
