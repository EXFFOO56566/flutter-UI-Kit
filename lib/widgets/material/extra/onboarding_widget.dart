/*
* File : Custom Onboarding
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
            body: Container(
                child: FxOnBoarding(
          pages: <PageViewModel>[
            PageViewModel(
              theme.backgroundColor,
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Icon(
                      Icons.shopping_bag_outlined,
                      size: MediaQuery.of(context).size.height * 0.22,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    )),
                    SizedBox(height: 30.0),
                    Text('Find Lots of product\naround the world',
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w600))),
                    SizedBox(height: 15.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                      style: theme.textTheme.bodyText2!.merge(
                        TextStyle(
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PageViewModel(
              theme.backgroundColor,
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Icon(
                      Icons.credit_card_off_outlined,
                      size: MediaQuery.of(context).size.height * 0.22,
                      color: theme.colorScheme.onBackground.withAlpha(190),
                    )),
                    SizedBox(height: 30.0),
                    Text(
                      'Secure payment\nwith SSL ',
                      style: theme.textTheme.bodyText1!.merge(TextStyle(
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                        'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                        style: theme.textTheme.bodyText2!.merge(
                          TextStyle(
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              letterSpacing: 0.1,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ),
            PageViewModel(
              theme.backgroundColor,
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Icon(
                      Icons.delivery_dining_outlined,
                      size: MediaQuery.of(context).size.height * 0.22,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    )),
                    SizedBox(height: 30.0),
                    Text('Fast delivery\nat a snap',
                        style: theme.textTheme.bodyText1!.merge(TextStyle(
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w600))),
                    SizedBox(height: 15.0),
                    Text(
                        'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                        style: theme.textTheme.bodyText2!.merge(
                          TextStyle(
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              letterSpacing: 0.1,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ),
          ],
          unSelectedIndicatorColor: theme.colorScheme.secondary,
          selectedIndicatorColor: theme.colorScheme.primary,
          doneWidget: Material(
            child: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text("DONE".toUpperCase(),
                    style: theme.textTheme.subtitle2!.merge(TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6))),
              ),
            ),
          ),
          skipWidget: Material(
            child: InkWell(
              splashColor: theme.colorScheme.secondary,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text("Skip".toUpperCase(),
                    style: theme.textTheme.subtitle2!.merge(TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6))),
              ),
            ),
          ),
        ))));
  }
}
