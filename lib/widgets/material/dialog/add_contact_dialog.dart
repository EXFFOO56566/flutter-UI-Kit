/*
* File : Add Contact 
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class AddContactDialog extends StatefulWidget {
  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _AddContactDialogState extends State<AddContactDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _AddContactDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.account_circle_outlined),
          elevation: 2,
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxText.titleSmall("Tap on ",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
              Icon(Icons.account_circle_outlined,
                  size: 18, color: theme.colorScheme.onBackground),
              FxText.titleSmall(" to add  contact",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
            ],
          ),
        ));
  }
}

class _AddContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: FxSpacing.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 64,
                      height: 64,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image(
                            image: AssetImage(Images.profilePlaceholder),
                            fit: BoxFit.cover,
                          ))),
                  FxSpacing.width(20),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                            hintStyle: FxTextStyle.bodyMedium(),
                            hintText: "First name",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                            hintStyle: FxTextStyle.bodyMedium(),
                            hintText: "Surname",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: FxSpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(
                          FeatherIcons.home,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: FxTextStyle.bodyMedium(),
                          hintText: "Company",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(
                          FeatherIcons.briefcase,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: FxTextStyle.bodyMedium(),
                          hintText: "Job title",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(
                          FeatherIcons.mail,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: FxTextStyle.bodyMedium(),
                          hintText: "Email",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(
                          FeatherIcons.phone,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: FxTextStyle.bodyMedium(),
                          hintText: "Phone",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.top(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(
                          FeatherIcons.filePlus,
                          size: 20,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                          hintStyle: FxTextStyle.bodyMedium(),
                          hintText: "Note",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: FxSpacing.top(16),
                  child: FxButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: FxText.labelMedium("Add to contact".toUpperCase(),
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.4),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
