/*
* File : Feedback Form
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeedbackFormWidget extends StatefulWidget {
  @override
  _FeedbackFormWidgetState createState() => _FeedbackFormWidgetState();
}

class _FeedbackFormWidgetState extends State<FeedbackFormWidget> {
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
          title: FxText.titleMedium("Feedback Form", fontWeight: 600),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                color: theme.colorScheme.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium("Send us your feedback!",
                        fontWeight: 700),
                    Container(
                        margin: EdgeInsets.only(top: 4),
                        child: FxText.bodyMedium(
                            "Do you have a suggestion or found a bug?",
                            fontWeight: 500)),
                    FxText.bodyMedium("Let us know by fill this form",
                        fontWeight: 500),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: FxText.titleMedium("How was your experience?",
                    fontWeight: 700),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 16),
                child: Row(
                  children: <Widget>[
                    Icon(MdiIcons.emoticonOutline,
                        color: theme.colorScheme.primary, size: 32),
                    Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Icon(MdiIcons.emoticonNeutralOutline,
                            color:
                                theme.colorScheme.onBackground.withAlpha(160),
                            size: 32)),
                    Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Icon(MdiIcons.emoticonSadOutline,
                            color:
                                theme.colorScheme.onBackground.withAlpha(160),
                            size: 32)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Describe your experience",
                    isDense: true,
                    filled: true,
                    fillColor: theme.colorScheme.background,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 5,
                  maxLines: 10,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      visualDensity: VisualDensity.compact,
                      activeColor: theme.colorScheme.primary,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value;
                        });
                      },
                    ),
                    FxText.titleSmall("Bug", fontWeight: 600),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Radio(
                        value: 2,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                    ),
                    FxText.titleSmall("Suggestion", fontWeight: 600),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Radio(
                        value: 3,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                        groupValue: _radioValue,
                        onChanged: (int? value) {
                          setState(() {
                            _radioValue = value;
                          });
                        },
                      ),
                    ),
                    FxText.titleSmall("Others", fontWeight: 600),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(20, 20, 20, 0),
                child: FxButton.block(
                  onPressed: () {},
                  elevation: 0,
                  child: FxText.bodyLarge("Send Feedback",
                      color: theme.colorScheme.onSecondary),
                  borderRadiusAll: 4,
                ),
              ),
            ],
          ),
        )));
  }
}
