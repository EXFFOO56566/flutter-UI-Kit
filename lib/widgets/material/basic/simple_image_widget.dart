/*
* File : Simple Image
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SimpleImageWidget extends StatefulWidget {
  @override
  _SimpleImageWidgetState createState() => _SimpleImageWidgetState();
}

class _SimpleImageWidgetState extends State<SimpleImageWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
          title: FxText.titleLarge("Images", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _ImageBadgeWidget(
                              image: './assets/images/profile/avatar.jpg',
                              badgeNumber: 3,
                            ),
                            _ImageBadgeWidget(
                              image: './assets/images/profile/avatar_2.jpg',
                              badgeNumber: 1,
                            ),
                            _ImageBadgeWidget(
                              image: './assets/images/profile/avatar_1.jpg',
                              badgeNumber: 2,
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage('./assets/images/all/all-7.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: _CircularWidget(
                        radius: 100,
                        image: './assets/images/all/all-9.jpg',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage('./assets/images/all/all-l3.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 200,
                      height: 350,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage('./assets/images/all/all-p2.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

class _ImageBadgeWidget extends StatelessWidget {
  final String image;
  final int badgeNumber;

  const _ImageBadgeWidget(
      {Key? key, required this.image, required this.badgeNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                new DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(0),
            height: 18,
            width: 18,
            decoration: new BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: new BorderRadius.all(Radius.circular(40))),
            child: Center(
              child: FxText(badgeNumber.toString(),
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                  fontSize: 9),
            ),
          ),
        )
      ],
    );
  }
}

class _CircularWidget extends StatelessWidget {
  final String image;
  final double radius;

  const _CircularWidget({Key? key, required this.radius, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
