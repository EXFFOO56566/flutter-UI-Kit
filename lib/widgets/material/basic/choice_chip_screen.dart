/*
* File : Choice chip
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class ChoiceChipScreen extends StatefulWidget {
  @override
  _ChoiceChipScreenState createState() => _ChoiceChipScreenState();
}

class _ChoiceChipScreenState extends State<ChoiceChipScreen> {
  List<String> _reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChoiceDialog(
              reportList: _reportList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FxButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _showDialog();
          },
          child: FxText.labelMedium("Report".toUpperCase(),
              fontWeight: 700, color: theme.colorScheme.onPrimary)),
    ));
  }
}

class ChoiceDialog extends StatefulWidget {
  final List<String> reportList;

  const ChoiceDialog({Key? key, required this.reportList}) : super(key: key);

  @override
  _ChoiceDialogState createState() => _ChoiceDialogState();
}

class _ChoiceDialogState extends State<ChoiceDialog> {
  List<String> selectedChoices = [];

  late ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: FxText.bodyMedium(item,
              color: selectedChoices.contains(item)
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return AlertDialog(
      title: FxText.bodyLarge("Report Video", fontWeight: 600),
      content: Container(
        child: Wrap(
          children: _buildChoiceList(),
        ),
      ),
      actions: <Widget>[
        FxButton.text(
          borderRadiusAll: 4,
          child: FxText.titleSmall("REPORT",
              fontWeight: 600, color: themeData.colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
