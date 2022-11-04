/*
* File : Contact List
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContactListWidget extends StatefulWidget {
  @override
  _ContactListWidgetState createState() => _ContactListWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ContactListWidgetState extends State<ContactListWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late List<Contact> _contactList;
  late CustomTheme customTheme;
  late ThemeData theme;

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
          title: FxText.titleMedium("Contact", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSimpleSnackbar("Add new contact");
          },
          child: Icon(MdiIcons.accountPlus),
          elevation: 2,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: _contactList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: FxText.titleMedium(_contactList[index].name[0],
                        color: theme.colorScheme.onSecondary, fontWeight: 700),
                    backgroundColor: theme.colorScheme.secondary,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
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
            );
          },
        ));
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

  void showSimpleSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
