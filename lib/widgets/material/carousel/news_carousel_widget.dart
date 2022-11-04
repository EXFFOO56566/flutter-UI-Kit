/*
* File : News Carousel
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewsCarouselWidget extends StatefulWidget {
  @override
  _NewsCarouselWidgetState createState() => _NewsCarouselWidgetState();
}

class _NewsCarouselWidgetState extends State<NewsCarouselWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("World News", fontWeight: 600),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: PageView(
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    _SingleNewsPage(
                      image: './assets/images/all/all-p1.jpg',
                      title: "What happened at MOUNTAIN?",
                      date: "June 18, 2020",
                      description: _newsContent,
                      view: 290,
                    ),
                    _SingleNewsPage(
                      image: './assets/images/all/all-p2.jpg',
                      title: "What happened under SEA?",
                      date: "April 12, 2020",
                      description: _newsContent,
                      view: 3481,
                    ),
                    _SingleNewsPage(
                      image: './assets/images/all/all-p3.jpg',
                      title: "What happened at CUBA?",
                      date: "Feb 14, 2020",
                      description: _newsContent,
                      view: 4852,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicatorStatic(),
              ),
            ),
          ],
        ));
  }
}

class _SingleNewsPage extends StatelessWidget {
  final String image, date, title, description;
  final int view;

  const _SingleNewsPage(
      {Key? key,
      required this.image,
      required this.date,
      required this.title,
      required this.description,
      required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage(image),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.bodyMedium(date, fontWeight: 700),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: FxText.titleLarge(
                          title,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: FxText.bodyMedium(description,
                            fontWeight: 500, height: 1.2),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Icon(
                                  MdiIcons.eye,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  size: 20,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: FxText.bodySmall(view.toString(),
                                  fontWeight: 700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: FxButton(
                              elevation: 0,
                              borderRadiusAll: 4,
                              onPressed: () {},
                              child: FxText.bodyMedium("READ MORE",
                                  fontWeight: 700,
                                  color: theme.colorScheme.onPrimary)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
