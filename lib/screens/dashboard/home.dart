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

  Map<String, IconData> drds = {
    'Profile': Icons.person,
    'My Wallet': Icons.wallet,
    'My Post': Icons.post_add,
    'About': Icons.question_mark,
    'Watch Ads': Icons.star,
    'Exit': Icons.logout
  };

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
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            bottomLeft: Radius.zero,
          ),
        ),
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            // flexible container with child of History answer widget

            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Settings',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            for (var a in drds.keys)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Icon(drds[a]),
                            ),
                            RichText(
                              text: TextSpan(
                                text: a,
                                // text: 'Profile',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 57,
                    height: 1,
                    thickness: 0.5,
                    color: Colors.black54,
                  ),
                ],
              ),
          ],
        ),
      ),
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
                    var route = MaterialPageRoute(
                        builder: (context) => const ViewPost());
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
            tabs: const [
              Tab(text: 'Trending'),
              Tab(text: 'My Topics'),
              Tab(text: 'Politics'),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: const [
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
