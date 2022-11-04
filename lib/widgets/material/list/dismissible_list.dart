/*
* File : Dismissible List
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class DismissibleList extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _WidgetState extends State<DismissibleList> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late ThemeData theme;
  late CustomTheme customTheme;

  late List<SingleMail> _mailList;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _mailList = [
      SingleMail("BookMyShow", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "21 April", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "22 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "19 Feb", false),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "17 April", true),
      SingleMail("Lourensa", "#stayinhome challenge is back",
          "this is dummy mail content", "15 May", false),
      SingleMail("Codeforces", "#stayinhome challenge is back",
          "this is dummy mail content", "13 Jan", true),
      SingleMail("Flutter", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", true),
      SingleMail("Google", "#stayinhome challenge is back",
          "this is dummy mail content", "30 April", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "27 Feb", true),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "14 May", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: FxSpacing.all(0),
      itemCount: _mailList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: theme.primaryColor,
            padding: FxSpacing.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.delete_outline,
                  color: theme.colorScheme.onPrimary,
                ),
                Padding(
                  padding: FxSpacing.left(8),
                  child: FxText.bodyMedium("Delete",
                      fontWeight: 500, color: theme.colorScheme.onPrimary),
                )
              ],
            ),
          ),
          secondaryBackground: Container(
            color: theme.primaryColor,
            padding: FxSpacing.x(20),
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FxText.bodyMedium("Archive",
                    fontWeight: 500, color: theme.colorScheme.onPrimary),
                Padding(
                  padding: FxSpacing.left(8),
                  child: Icon(
                    Icons.archive_outlined,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              setState(() {
                _mailList.removeAt(index);
                showSnackBarWithFloating("Archived");
              });
            } else {
              setState(() {
                _mailList.removeAt(index);
                showSnackBarWithFloating("Deleted");
              });
            }
          },
          key: UniqueKey(),
          child: Padding(
            padding: FxSpacing.xy(16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: FxText(
                    _mailList[index].name[0],
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: FxText.titleSmall(
                              _mailList[index].name,
                              fontWeight: _mailList[index].isRead ? 600 : 800,
                            ),
                          ),
                          FxText.titleSmall(
                            _mailList[index].date,
                            fontWeight: _mailList[index].isRead ? 600 : 800,
                          ),
                        ],
                      ),
                      FxText.titleSmall(
                        _mailList[index].title,
                        fontWeight: _mailList[index].isRead ? 600 : 800,
                      ),
                      FxText.bodyMedium(
                        _mailList[index].message,
                        fontWeight: 600,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
