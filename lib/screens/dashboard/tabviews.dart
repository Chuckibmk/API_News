import 'package:flutter/material.dart';

class DashTabs extends StatefulWidget {
  const DashTabs({super.key});

  @override
  State<DashTabs> createState() => _DashTabsState();
}

class _DashTabsState extends State<DashTabs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              // shape: ,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.asset(
                      'assets/logo/DT_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
