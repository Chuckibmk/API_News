import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class DashTabs extends StatefulWidget {
  const DashTabs({super.key});

  @override
  State<DashTabs> createState() => _DashTabsState();
}

class _DashTabsState extends State<DashTabs> {
  final List<String> breakinglist = [
    'assets/image/bbc_b1.jpeg',
    'assets/image/bbc_b2.jpeg',
    'assets/image/bbc_b3.jpeg',
    'assets/image/bbc_b4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CarouselSlider(
                items: breakinglist.map((e) => Image.asset(e)).toList(),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  onPageChanged: (i, CarouselPageChangedReason) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.zero,
                    ),
                    child: Image.asset(
                      'assets/logo/DT_Logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                          'Moahali blast: Police find dump of 7,000 mobile phones, Oppn knocks security lapses',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        // padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                ExactAssetImage('assets/logo/DT_favicon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Robert Thatcher',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                          'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: const Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: const Icon(
                              Icons.chat_bubble_outline,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: const Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '98 comments',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 10,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '4.1k Views',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
