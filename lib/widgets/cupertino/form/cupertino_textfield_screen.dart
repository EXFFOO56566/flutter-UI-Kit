/*
* File : Cupertino TextField
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoTextFieldScreen extends StatefulWidget {
  @override
  _CupertinoTextFieldScreenState createState() =>
      _CupertinoTextFieldScreenState();
}

class _CupertinoTextFieldScreenState extends State<CupertinoTextFieldScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: FxSpacing.y(16), children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: FxText.titleSmall("Simple", fontWeight: 500),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(color: theme.colorScheme.background),
            cursorColor: theme.colorScheme.secondary,
            placeholder: "Email",
            style: TextStyle(color: theme.colorScheme.onBackground),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
            padding: FxSpacing.xy(8, 16),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Bordered", fontWeight: 500),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Email",
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Prefix Icon", fontWeight: 500),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Email",
            prefix: Padding(
              padding: FxSpacing.x(16),
              child: Icon(
                Icons.email_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Suffix Icon", fontWeight: 600),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Contact",
            suffix: Padding(
              padding: FxSpacing.x(8),
              child: Icon(
                Icons.contacts_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Both Icon", fontWeight: 600),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            obscureText: _passwordVisible,
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Password",
            prefix: Padding(
              padding: FxSpacing.x(8),
              child: Icon(
                Icons.lock_outline,
                color: theme.colorScheme.primary,
              ),
            ),
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              child: Padding(
                padding: FxSpacing.x(8),
                child: Icon(
                  _passwordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Rounded", fontWeight: 600),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Email",
            prefix: Padding(
              padding: FxSpacing.x(8),
              child: Icon(
                Icons.email_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
          ),
        ),
        Container(
          padding: FxSpacing.fromLTRB(16, 16, 16, 8),
          child: FxText.titleSmall("Text Area", fontWeight: 500),
        ),
        Container(
          padding: FxSpacing.x(16),
          child: CupertinoTextField(
            decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: Border.all(color: theme.colorScheme.primary)),
            cursorColor: theme.colorScheme.primary,
            placeholder: "Comment me",
            placeholderStyle:
                TextStyle(color: theme.colorScheme.onBackground.withAlpha(160)),
            minLines: 4,
            maxLines: 6,
            style: TextStyle(color: theme.colorScheme.onBackground),
            padding: FxSpacing.xy(8, 16),
          ),
        ),
      ]),
    );
  }
}
