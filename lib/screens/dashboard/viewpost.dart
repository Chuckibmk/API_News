import 'package:api_news/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  ScrollController scrollcont = ScrollController();

  bool isScrollingDown = true;

  void _scrollListener() {
    if (scrollcont.position.userScrollDirection == ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
      }
    }

    if (scrollcont.position.userScrollDirection == ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
      }
    }
  }

  gotoTop() {
    scrollcont.animateTo(0.0,
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  void initState() {
    scrollcont = ScrollController();
    scrollcont.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // scrollcont.dispose();
    // scrollcont.addListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoTop();
        },
        child: const Icon(Icons.arrow_upward),
      ),
      body: SingleChildScrollView(
        controller: scrollcont,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: const Icon(Icons.file_upload_outlined),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.zero,
                        bottom: Radius.zero,
                      ),
                      child: Image.asset(
                        'assets/logo/DT_Logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text:
                            'Moahali blast: Police find dump of 7,000 mobile phones, Oppn knocks security lapses',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
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
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'assets/logo/DT_favicon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Robert Thatcher',
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
                        // Container(),
                        RichText(
                          text: TextSpan(
                            text: '1hr ago',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: const Icon(
                                Icons.chat_bubble_outline,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '98 comments',
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
                            RichText(
                              text: TextSpan(
                                text: '34 Likes',
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
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: const Icon(
                                Icons.share,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Share',
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
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: const Icon(
                                Icons.bar_chart_rounded,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '34k Reads',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text:
                              'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate. \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  'Veniam labore reprehenderit pariatur irure eiusmod mollit id ex do velit adipisicing eu sint ad. Cupidatat occaecat pariatur excepteur esse laboris anim cillum incididunt sit. Est nisi elit reprehenderit consequat magna ex nisi deserunt duis. Occaecat anim et id consequat irure eu voluptate pariatur ex.',
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text:
                              'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate. \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  'Veniam labore reprehenderit pariatur irure eiusmod mollit id ex do velit adipisicing eu sint ad. Cupidatat occaecat pariatur excepteur esse laboris anim cillum incididunt sit. Est nisi elit reprehenderit consequat magna ex nisi deserunt duis. Occaecat anim et id consequat irure eu voluptate pariatur ex.',
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text:
                              'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate. \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  'Veniam labore reprehenderit pariatur irure eiusmod mollit id ex do velit adipisicing eu sint ad. Cupidatat occaecat pariatur excepteur esse laboris anim cillum incididunt sit. Est nisi elit reprehenderit consequat magna ex nisi deserunt duis. Occaecat anim et id consequat irure eu voluptate pariatur ex.',
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text:
                              'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate. \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  'Veniam labore reprehenderit pariatur irure eiusmod mollit id ex do velit adipisicing eu sint ad. Cupidatat occaecat pariatur excepteur esse laboris anim cillum incididunt sit. Est nisi elit reprehenderit consequat magna ex nisi deserunt duis. Occaecat anim et id consequat irure eu voluptate pariatur ex.',
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text:
                              'Ea duis culpa adipisicing commodo nisi mollit. Officia aute nulla Lorem labore ipsum eiusmod ullamco irure occaecat. Aliquip elit labore est labore non nulla aliqua velit mollit. Sit veniam irure sit velit sint irure ex est ex est exercitation voluptate. \n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(
                              text:
                                  'Veniam labore reprehenderit pariatur irure eiusmod mollit id ex do velit adipisicing eu sint ad. Cupidatat occaecat pariatur excepteur esse laboris anim cillum incididunt sit. Est nisi elit reprehenderit consequat magna ex nisi deserunt duis. Occaecat anim et id consequat irure eu voluptate pariatur ex.',
                            ),
                          ]),
                    ),
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
