/*
* File : Filter (Tags) Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterSearchWidget extends StatefulWidget {
  @override
  _FilterSearchWidgetState createState() => _FilterSearchWidgetState();
}

class _FilterSearchWidgetState extends State<FilterSearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  List<String> _tagList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  List<String> _selectedTags = [];

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    _tagList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: theme.colorScheme.primary,
          label: FxText.bodyMedium(item,
              color: _selectedTags.contains(item)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground),
          selected: _selectedTags.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedTags.contains(item)
                  ? _selectedTags.remove(item)
                  : _selectedTags.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        FxSpacing.height(32),
        FxContainer(
          margin: EdgeInsets.all(8),
          padding:
              const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        size: 24,
                        color: theme.colorScheme.onBackground.withAlpha(240),
                      )),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 8),
                      child: Container(
                        child: FxTextField(
                          decoration: InputDecoration(
                            hintText: "Search here",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            isDense: true,
                          ),
                          autofocus: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          textCapitalization: TextCapitalization.sentences,
                          onSubmitted: _onSubmit,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.secondary,
                    child: FxText.titleSmall("D",
                        color: theme.colorScheme.onSecondary),
                  )
                ],
              ),
              Divider(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 4, top: 4),
                      child: FxText.bodyMedium("TAGS", fontWeight: 700),
                    ),
                    Wrap(
                      children: _buildChoiceList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: _isInProgress
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    )),
                  ),
                )
              : Container(
                  color: theme.backgroundColor,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          MdiIcons.emoticonSadOutline,
                          size: 32,
                          color: theme.colorScheme.onBackground,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child:
                              FxText.titleMedium("No Result!", fontWeight: 700),
                        ),
                        FxText.titleSmall("Try another keyword",
                            fontWeight: 500),
                      ],
                    ),
                  )),
        ),
      ],
    ));
  }
}
