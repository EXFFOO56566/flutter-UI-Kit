/*
* File : Extended FAB
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExtendedFABWidget extends StatefulWidget {
  @override
  _ExtendedFABWidgetState createState() => _ExtendedFABWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ExtendedFABWidgetState extends State<ExtendedFABWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late List<Contact> _contactList;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _contactList = [
      Contact("Zahra Tate", "+1 987456321"),
      Contact("Willard Palmer", "+4 154789632"),
      Contact("Charlotte Small", "+1 521478963"),
      Contact("Stanley Lindsey", "+18 123654789"),
      Contact("Ebony Bowman", "+4 987456321"),
      Contact("Rosa Lloyd", "+91 789456321"),
      Contact("Shane Roman", "+1 147852369"),
      Contact("Ashley Cruz", "+14 159632147"),
      Contact("Elle Mendoza", "+78 697412369"),
      Contact("Kieron Lucero", "+178 52314569"),
      Contact("Mitchell Brady", "0291 215496"),
      Contact("Casey Calderon", "+1 125893478"),
      Contact("Jodie Caldwell", "+1 147852369"),
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
          title: FxText.titleMedium("Extended FAB", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showSnackbar("Add new contact");
          },
          elevation: 2,
          label: FxText.titleSmall("New contact".toUpperCase(),
              fontWeight: 600,
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.3),
          icon: Icon(MdiIcons.plus),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      showSnackbar("Edit " + _contactList[index].name);
                    } else {
                      showSnackbar("Calling " + _contactList[index].name);
                    }
                    return false;
                  },
                  dismissThresholds: const {
                    DismissDirection.endToStart: 0.4,
                    DismissDirection.startToEnd: 0.4,
                  },
                  background: Container(
                    color: theme.colorScheme.background,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerStart,
                    child: ClipOval(
                      child: Material(
                        color: theme.primaryColor.withAlpha(24),
                        // button color
                        child: InkWell(
                          splashColor: theme.colorScheme.primary,
                          // inkwell color
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                MdiIcons.phoneOutgoingOutline,
                                color: theme.colorScheme.primary,
                                size: 24,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: theme.colorScheme.background,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: ClipOval(
                      child: Material(
                        color: theme.primaryColor.withAlpha(24),
                        child: InkWell(
                          splashColor: theme.colorScheme.primary,
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                MdiIcons.accountEditOutline,
                                color: theme.colorScheme.primary,
                                size: 24,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      showSnackbar("Edit " + _contactList[index].name);
                    } else {
                      showSnackbar("Calling " + _contactList[index].name);
                    }
                  },
                  key: UniqueKey(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          child: FxText.titleMedium(_contactList[index].name[0],
                              color: theme.colorScheme.onSecondary),
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              children: <Widget>[
                                FxText.titleMedium(_contactList[index].name,
                                    fontWeight: 600),
                                FxText.bodyMedium(_contactList[index].number,
                                    fontWeight: 500),
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

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
