/*
* File : Contact List
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ContactListState extends State<ContactList> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late List<Contact> _contactList;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSimpleSnackBar("Add new contact");
          },
          child: Icon(Icons.account_circle_outlined),
          elevation: 2,
        ),
        body: Container(
            color: theme.backgroundColor,
            child: ListView.builder(
              padding: FxSpacing.all(0),
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: FxSpacing.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: FxText.titleMedium(_contactList[index].name[0],
                            color: theme.colorScheme.onSecondary,
                            fontWeight: 600),
                        backgroundColor: theme.colorScheme.secondary,
                      ),
                      FxSpacing.width(20),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            FxText.titleMedium(_contactList[index].name,
                                fontWeight: 600),
                            FxText.bodyMedium(_contactList[index].number,
                                fontWeight: 500),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
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

  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
