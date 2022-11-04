/*
* File : ActionFxText FAB
* Version : 1.0.0
* */

import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ActionTextFABWidget extends StatefulWidget {
  @override
  _ActionTextFABWidgetState createState() => _ActionTextFABWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ActionTextFABWidgetState extends State<ActionTextFABWidget>
    with TickerProviderStateMixin {
  late ThemeData theme;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late AnimationController _controller;
  double _contentOpacity = 1;

  static const List<IconData> icons = const [
    MdiIcons.google,
    MdiIcons.facebook,
    MdiIcons.whatsapp
  ];
  static const List<String> iconsText = const [
    "Google",
    "Facebook",
    "WhatsApp"
  ];

  List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Container(
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    return list;
  }

  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("FAB with Action", fontWeight: 600),
        ),
        floatingActionButton: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: new List.generate(icons.length, (int index) {
            Widget child = new Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child: new ScaleTransition(
                scale: new CurvedAnimation(
                  parent: _controller,
                  curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                      curve: Curves.easeOutQuint),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                      margin: EdgeInsets.only(right: 4),
                      color: theme.colorScheme.secondary,
                      child: FxText.bodyMedium(iconsText[index],
                          color: theme.colorScheme.onSecondary,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    ),
                    FloatingActionButton(
                      heroTag: null,
                      backgroundColor: theme.colorScheme.secondary,
                      mini: true,
                      child: new Icon(icons[index],
                          color: theme.colorScheme.onSecondary),
                      onPressed: () {
                        showSimpleSnackbar();
                      },
                    ),
                  ],
                ),
              ),
            );
            return child;
          }).toList()
            ..add(
              new FloatingActionButton(
                heroTag: null,
                backgroundColor: theme.colorScheme.primary,
                child: new AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return new Transform(
                      transform:
                          new Matrix4.rotationZ(_controller.value * 0.5 * pi),
                      alignment: FractionalOffset.center,
                      child: new Icon(
                        _controller.isDismissed ? Icons.share : Icons.close,
                        color: theme.colorScheme.onPrimary,
                      ),
                    );
                  },
                ),
                onPressed: () {
                  if (_controller.isDismissed) {
                    setState(() {
                      _contentOpacity = 0.6;
                    });
                    _controller.forward();
                  } else {
                    setState(() {
                      _contentOpacity = 1;
                    });
                    _controller.reverse();
                  }
                },
              ),
            ),
        ),
        body: Opacity(
          opacity: _contentOpacity,
          child: Container(
              margin: EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
              color: theme.backgroundColor,
              child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(4),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: _generateGridItems())),
        ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content:
            FxText.titleSmall("Sharing", color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
