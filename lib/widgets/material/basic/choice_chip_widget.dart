/*
* File : Choice chip
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ChoiceChipWidget extends StatefulWidget {
  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  List<String> _reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Choice chip", fontWeight: 600),
        ),
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

  late ThemeData theme;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: theme.colorScheme.primary,
          label: FxText.bodyMedium(item,
              color: selectedChoices.contains(item)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
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
    theme = Theme.of(context);
    return AlertDialog(
      title: FxText.bodyLarge("Report Video", fontWeight: 600),
      content: Container(
        child: Wrap(
          children: _buildChoiceList(),
        ),
      ),
      actions: <Widget>[
        FxButton(
          borderRadiusAll: 4,
          elevation: 0,
          child: FxText.bodyLarge("REPORT",
              fontWeight: 600, color: theme.colorScheme.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FxSpacing.width(8)
      ],
    );
  }
}
