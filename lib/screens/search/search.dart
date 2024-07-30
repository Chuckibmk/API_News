import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final srchctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      // padding: EdgeInsets.all(30),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: TextFormField(
                        controller: srchctrl,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              // borderSide: const BorderSide(
                              //     color: Colors.purple, width: 3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Search",
                            suffixIcon: const Icon(Icons.search)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Popular Tags',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'View All',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Placeholder(),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Latest News',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'View All',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Placeholder(),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Recommendation Topic',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'View All',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Placeholder(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
