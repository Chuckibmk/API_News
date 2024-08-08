import 'package:api_news/screens/account/profile.dart';
import 'package:api_news/screens/dashboard/post.dart';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:api_news/routes/app/app-route-names.dart';
// import 'package:api_news/routes/app/app-route.dart';
import 'package:api_news/screens/dashboard/home.dart';
import 'package:api_news/screens/search/search.dart';
// import 'package:get/route_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  //scaffold variable for drawer control, stores the state of the drawer

  final _controller = PageController();
  int currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Home(),
                  Search(),
                  Post(),
                  Placeholder(),
                  Profile(),
                ],
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded), label: 'Add Post'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
