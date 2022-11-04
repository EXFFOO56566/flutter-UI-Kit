/*
* File : Simple Carousel
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class SimpleCarousel extends StatefulWidget {
  @override
  _SimpleCarouselState createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
        color: isActive ? Colors.white : Colors.white.withAlpha(140),
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
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
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Image.asset(
                        Images.landscapes[0],
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset(
                        Images.landscapes[1],
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset(
                        Images.landscapes[2],
                        height: 240.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicatorStatic(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: FxText.titleMedium("Body content",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.3),
            ),
          ),
        ),
      ],
    ));
  }
}
