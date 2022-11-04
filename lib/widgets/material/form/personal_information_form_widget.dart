/*
* File : Personal Information Form
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PersonalInformationFormWidget extends StatefulWidget {
  @override
  _PersonalInformationFormWidgetState createState() =>
      _PersonalInformationFormWidgetState();
}

class _PersonalInformationFormWidgetState
    extends State<PersonalInformationFormWidget> {
  int? _radioValue = 1;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Personal Information", fontWeight: 600),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: FxSpacing.nTop(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 12),
                  child: FxText.titleMedium("Personal", fontWeight: 600),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: theme.inputDecorationTheme.border,
                    enabledBorder: theme.inputDecorationTheme.border,
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    prefixIcon: Icon(MdiIcons.accountOutline, size: 24),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(MdiIcons.accountOutline, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "DOB",
                      hintText: "DD/MM/YYYY",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        MdiIcons.calendarBlankOutline,
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
                        margin: EdgeInsets.only(left: 8),
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
                        margin: EdgeInsets.only(left: 8),
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
                  padding: EdgeInsets.only(top: 20),
                  child: FxText.titleMedium("Contact", fontWeight: 600),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        MdiIcons.emailOutline,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Contact",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(
                        MdiIcons.phoneOutline,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child:
                      FxText.titleMedium("Other Information", fontWeight: 600),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nick Name",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(MdiIcons.accountChildOutline, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Interest",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: Icon(MdiIcons.gamepadCircleOutline, size: 24),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withAlpha(28),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: FxText.bodyMedium("SAVE",
                            fontWeight: 700,
                            letterSpacing: 0.2,
                            color: theme.colorScheme.onPrimary)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
