import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:api_news/routes/app/app-route-names.dart';
// import 'package:api_news/routes/app/app-route.dart';

import 'package:api_news/screens/dashboard/tabviews.dart';
import 'package:api_news/screens/dashboard/viewpost.dart';
import 'package:get/route_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  //scaffold variable for drawer control, stores the state of the drawer
  var scaffoldkey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            bottomLeft: Radius.zero,
          ),
        ),
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            // flexible container with child of History answer widget
            Flexible(
              child: Placeholder(),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      //   color: Theme.of(context).colorScheme.onSurface,
                      //   shape: BoxShape.circle,
                      // ),
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            // use of scaffold variable store state after openEndDrawer
                            scaffoldkey.currentState?.openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Hi Robert',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        // color: Color(0xffF8FAFB),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (context) => ViewPost());
                          Navigator.push(context, route);
                        },
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: [
                  Tab(text: 'Trending'),
                  Tab(text: 'My Topics'),
                  Tab(text: 'Politics'),
                ],
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    DashTabs(),
                    Placeholder(),
                    Placeholder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
