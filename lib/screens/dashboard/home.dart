import 'package:flutter/material.dart';
import 'package:api_news/screens/dashboard/tabviews.dart';
import 'package:api_news/screens/dashboard/viewpost.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var scaffoldkey = GlobalKey<ScaffoldState>();

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // use of scaffold variable store state after openEndDrawer
                      scaffoldkey.currentState?.openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                    var route =
                        MaterialPageRoute(builder: (context) => ViewPost());
                    Navigator.push(context, route);
                  },
                  color: Colors.blue,
                ),
              ),
            ],
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
    );
  }
}
