import 'package:get/route_manager.dart';
import 'app-route-names.dart';
import 'package:api_news/screens/splash/splashscreen.dart';
import 'package:api_news/screens/dashboard/dashboard.dart';

List<GetPage> getPage = [
  // APP ROUTES

  GetPage(
    name: splash,
    page: () => SplashScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
      name: dashboard,
      page: () => Dashboard(),
      transition: Transition.cupertino),
  // GetPage()
];
