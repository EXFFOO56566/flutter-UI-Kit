/*
* File : Dismissible List
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DismissibleListWidget extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _WidgetState extends State<DismissibleListWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  late List<SingleMail> _mailList;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Dismissible List", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: _mailList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: theme.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.delete,
                          color: theme.colorScheme.onPrimary,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FxText.bodyMedium("Delete",
                              fontWeight: 500,
                              color: theme.colorScheme.onPrimary),
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: theme.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FxText.bodyMedium("Archive",
                            fontWeight: 500,
                            color: theme.colorScheme.onPrimary),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            MdiIcons.inboxArrowDown,
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
                        showSnackbarWithFloating("Archived");
                      });
                    } else {
                      setState(() {
                        _mailList.removeAt(index);
                        showSnackbarWithFloating("Deleted");
                      });
                    }
                  },
                  key: UniqueKey(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 16, right: 16, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: FxText(
                            _mailList[index].name[0],
                            color: theme.colorScheme.onPrimary,
                          ),
                          backgroundColor: theme.colorScheme.primary,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: FxText.titleSmall(
                                            _mailList[index].name,
                                            fontWeight: _mailList[index].isRead
                                                ? 600
                                                : 800)),
                                    FxText.titleSmall(_mailList[index].date,
                                        fontWeight:
                                            _mailList[index].isRead ? 600 : 800)
                                  ],
                                ),
                                FxText.titleSmall(_mailList[index].title,
                                    fontWeight:
                                        _mailList[index].isRead ? 600 : 800),
                                FxText.bodyMedium(_mailList[index].message,
                                    fontWeight: 600)
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
