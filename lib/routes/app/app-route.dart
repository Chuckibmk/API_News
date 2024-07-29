import 'package:get/route_manager.dart';
import 'app-route-names.dart';
import 'package:api_news/screens/splash/splashscreen.dart';
import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:api_news/screens/dashboard/tabviews.dart';
import 'package:api_news/screens/dashboard/viewpost.dart';

List<GetPage> getPage = [
  // APP ROUTES

  GetPage(
    name: splash,
    page: () => const SplashScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: dashboard,
    page: () => const Dashboard(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: tabview,
    page: () => const DashTabs(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: viewpost,
    page: () => const ViewPost(),
    transition: Transition.cupertino,
  )
];
