/*
* File : Personal Information Form
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PersonalInformationForm extends StatefulWidget {
  @override
  _PersonalInformationFormState createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  int? _radioValue = 1;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: FxSpacing.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: FxSpacing.fromLTRB(0, 0, 0, 12),
                  child: FxText.titleMedium("Personal", fontWeight: 600),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: theme.inputDecorationTheme.border,
                    enabledBorder: theme.inputDecorationTheme.border,
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    prefixIcon: Icon(Icons.account_circle_outlined, size: 24),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(Icons.account_circle_outlined, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "DOB",
                      hintText: "DD/MM/YYYY",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      FxText.bodyLarge("Gender", fontWeight: 600),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Radio(
                          value: 1,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      FxText.titleSmall("Male",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0.2,
                          fontWeight: 500),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Radio(
                          value: 2,
                          activeColor: theme.colorScheme.primary,
                          groupValue: _radioValue,
                          onChanged: (int? value) {
                            setState(() {
                              _radioValue = value;
                            });
                          },
                        ),
                      ),
                      FxText.titleSmall("Female",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0.2,
                          fontWeight: 500),
                    ],
                  ),
                ),
                Container(
                  padding: FxSpacing.top(20),
                  child: FxText.titleMedium("Contact", fontWeight: 600),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Contact",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: FxSpacing.top(20),
                  child:
                      FxText.titleMedium("Other Information", fontWeight: 600),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nick Name",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(Icons.account_circle_outlined, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Interest",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(Icons.gamepad_outlined, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(20),
                  alignment: Alignment.center,
                  child: FxButton(
                      onPressed: () {},
                      elevation: 0,
                      borderRadiusAll: 4,
                      padding: FxSpacing.xy(24, 8),
                      child: FxText.bodyMedium("SAVE",
                          fontWeight: 600,
                          letterSpacing: 0.2,
                          color: theme.colorScheme.onPrimary)),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
