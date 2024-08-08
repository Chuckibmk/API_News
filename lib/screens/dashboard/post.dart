import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (context) => const Dashboard());
                      Navigator.push(context, route);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
