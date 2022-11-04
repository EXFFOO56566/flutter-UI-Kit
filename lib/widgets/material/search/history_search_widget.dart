/*
* File : History Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistorySearchWidget extends StatefulWidget {
  @override
  _HistorySearchWidgetState createState() => _HistorySearchWidgetState();
}

class _HistorySearchWidgetState extends State<HistorySearchWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        FxSpacing.height(FxSpacing.safeAreaTop(context)),
        FxContainer(
          padding:
              const EdgeInsets.only(left: 12.0, top: 8, right: 12, bottom: 8),
          margin: EdgeInsets.all(20),
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
                        child: TextField(
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
                    child: FxText("A", color: theme.colorScheme.onSecondary),
                  )
                ],
              ),
              Divider(),
              _suggestionWidget('Suggestion 1'),
              _suggestionWidget('Suggestion 2'),
              _suggestionWidget('Suggestion 3'),
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

  Widget _suggestionWidget(String suggestion) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Icon(
            MdiIcons.history,
            size: 22,
            color: theme.colorScheme.onBackground.withAlpha(220),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: FxText.titleSmall(suggestion, fontWeight: 500)),
          )
        ],
      ),
    );
  }
}
