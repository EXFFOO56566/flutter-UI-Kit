/*
* File : Mail Home
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'mail_compose_screen.dart';
import 'mail_content_screen.dart';

class MailHomeScreen extends StatefulWidget {
  @override
  _MailHomeScreenState createState() => _MailHomeScreenState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _MailHomeScreenState extends State<MailHomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  late List<SingleMail> _mailList;
  int _selectedPage = 0;

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
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            key: scaffoldMessengerKey,
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              key: _scaffoldKey,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return MailComposeScreen();
                      },
                      fullscreenDialog: true));
                },
                child: Icon(
                  Icons.add,
                  size: 32,
                  color: theme.colorScheme.onPrimary,
                ),
                backgroundColor: theme.colorScheme.primary,
                elevation: 4,
              ),
              drawer: Drawer(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /*---------- Drawer Header ----------------*/
                    Expanded(
                      flex: 2,
                      child: DrawerHeader(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Container(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 16, bottom: 8, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          new Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/profile/avatar_2.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/profile/avatar_1.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          new Container(
                                            margin: EdgeInsets.only(left: 16),
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/profile/avatar.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FxText.titleLarge("Taslima Beattie",
                                        color: theme.colorScheme.onPrimary,
                                        fontWeight: 600),
                                    FxText.bodyMedium("tas@gmail.com",
                                        color: theme.colorScheme.onPrimary,
                                        fontWeight: 400)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(color: theme.primaryColor),
                      ),
                    ),

                    /*------------- Drawer Content -------------*/
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: theme.backgroundColor,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: <Widget>[
                              singleDrawerItem(
                                  MdiIcons.inbox, "All Inboxes", 0),
                              Divider(
                                height: 1,
                                color: theme.dividerColor,
                                thickness: 1,
                              ),
                              singleDrawerItem(
                                  MdiIcons.emailOutline, "Primary", 1),
                              singleDrawerItem(
                                  MdiIcons.accountGroupOutline, "Social", 2),
                              singleDrawerItem(
                                  MdiIcons.tagOutline, "Promotion", 3),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 12, left: 16, right: 16, bottom: 12),
                                child: FxText.bodySmall("ALL LABELS",
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(240),
                                    fontWeight: 700,
                                    letterSpacing: 0.35,
                                    wordSpacing: 1.2),
                              ),
                              singleDrawerItem(
                                  MdiIcons.starOutline, "Starred", 4),
                              singleDrawerItem(
                                  MdiIcons.clockOutline, "Snoozed", 5),
                              singleDrawerItem(MdiIcons.send, "Sent", 6),
                              singleDrawerItem(
                                  MdiIcons.fileOutline, "Drafts", 7),
                              singleDrawerItem(
                                  MdiIcons.emailMultipleOutline, "All Mail", 8),
                              singleDrawerItem(
                                  MdiIcons.alertOctagonOutline, "Spam", 9),
                              singleDrawerItem(
                                  MdiIcons.trashCanOutline, "Bin", 10),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 12, left: 16, right: 16, bottom: 12),
                                child: FxText.bodySmall("OTHER APPS",
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(240),
                                    fontWeight: 700,
                                    letterSpacing: 0.35,
                                    wordSpacing: 1.2),
                              ),
                              singleDrawerItem(MdiIcons.calendarBlankOutline,
                                  "Calender", 11),
                              singleDrawerItem(
                                  MdiIcons.accountCircleOutline, "Contact", 12),
                              Divider(
                                height: 1,
                                color: theme.dividerColor,
                                thickness: 1,
                              ),
                              singleDrawerItem(
                                  MdiIcons.wrenchOutline, "Settings", 13),
                              singleDrawerItem(MdiIcons.helpCircleOutline,
                                  "Help and feedback", 14),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxSpacing.height(32),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: FxContainer.none(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 12, top: 6, right: 12, bottom: 6),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  MdiIcons.menu,
                                  size: 24,
                                  color: theme.colorScheme.onBackground,
                                )),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16, right: 8),
                                child: Container(
                                  child: FxTextField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: customTheme.card,
                                        hintText: "Search here",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        isDense: true),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AccountDialog());
                              },
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/profile/avatar_2.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, bottom: 8),
                    child: FxText.bodySmall("PRIMARY",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.4,
                        fontWeight: 500),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _mailList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MailContentScreen()));
                          },
                          child: Dismissible(
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
                                    padding: EdgeInsets.only(left: 8),
                                    child: FxText.bodyMedium("Delete",
                                        fontWeight: 600,
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
                                      fontWeight: 600,
                                      color: theme.colorScheme.onPrimary),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
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
                                  showSnackbarWithFloating("1 Archived");
                                });
                              } else {
                                setState(() {
                                  _mailList.removeAt(index);
                                  showSnackbarWithFloating("1 Deleted");
                                });
                              }
                            },
                            key: UniqueKey(),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 12, left: 16, right: 16, bottom: 12),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: FxText(
                                        _mailList[index].name[0],
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: FxText.titleSmall(
                                                        _mailList[index].name,
                                                        fontWeight:
                                                            _mailList[index]
                                                                    .isRead
                                                                ? 500
                                                                : 600)),
                                                FxText.titleSmall(
                                                    _mailList[index].date,
                                                    fontWeight:
                                                        _mailList[index].isRead
                                                            ? 500
                                                            : 600)
                                              ],
                                            ),
                                            FxText.bodyMedium(
                                                _mailList[index].title,
                                                fontWeight:
                                                    _mailList[index].isRead
                                                        ? 500
                                                        : 600,
                                                letterSpacing: 0),
                                            FxText.bodyMedium(
                                                _mailList[index].message,
                                                fontWeight: 500,
                                                letterSpacing: 0)
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(top: 0.0, left: 16, right: 16, bottom: 0),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground),
      title: FxText.titleSmall(title,
          fontWeight: _selectedPage == position ? 600 : 500,
          letterSpacing: 0.2,
          color: _selectedPage == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}

class AccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Aishah Mcconnell", fontWeight: 600),
                      FxText.bodyMedium("ais@mcc.com", fontWeight: 500),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 12),
                        child: TextButton(
                            onPressed: () {},
                            child: FxText.bodyMedium("Manage all accounts",
                                fontWeight: 600)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_1.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Liana Fitzgeraldl", fontWeight: 600),
                      FxText.bodyMedium("liana.fits@gmail.com",
                          fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/profile/avatar.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Sally Lee", fontWeight: 600),
                      FxText.bodyMedium("sallylee@qq.com", fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Shamima Ballard", fontWeight: 600),
                      FxText.bodyMedium("ballard@gmail.com", fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Icon(
                      MdiIcons.accountPlusOutline,
                      color: theme.colorScheme.onBackground,
                      size: 22,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: FxText.titleSmall("Add another account",
                      fontWeight: 600, letterSpacing: 0),
                ),
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            alignment: AlignmentDirectional.center,
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      MdiIcons.logoutVariant,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: FxText.bodyMedium("Sign out from all account",
                          fontWeight: 500),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
