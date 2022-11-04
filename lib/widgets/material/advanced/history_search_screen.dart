/*
* File : History Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

class HistorySearchScreen extends StatefulWidget {
  @override
  _HistorySearchScreenState createState() => _HistorySearchScreenState();
}

class _HistorySearchScreenState extends State<HistorySearchScreen> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = Duration(milliseconds: 2500);
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
        body: ListView(
      children: <Widget>[
        Container(
          margin: FxSpacing.all(8),
          child: FxCard(
            shadow: FxShadow(elevation: 2),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FeatherIcons.chevronLeft,
                          size: 24,
                          color: theme.colorScheme.onBackground.withAlpha(240),
                        ).autoDirection()),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: FxSpacing.fromLTRB(16, 0, 8, 0),
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
                    FxContainer.rounded(
                      paddingAll: 12,
                      color: theme.colorScheme.primary,
                      child: Center(
                        child: FxText.titleSmall("A",
                            color: theme.colorScheme.onPrimary),
                      ),
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
        ),
        FxSpacing.height(32),
        _isInProgress
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
                        Icons.sentiment_dissatisfied_outlined,
                        size: 32,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                        margin: FxSpacing.top(8),
                        child:
                            FxText.titleMedium("No Result!", fontWeight: 700),
                      ),
                      FxText.titleSmall("Try another keyword", fontWeight: 500),
                    ],
                  ),
                )),
      ],
    ));
  }

  Widget _suggestionWidget(String suggestion) {
    return Container(
      margin: FxSpacing.top(8),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.history,
            size: 22,
            color: theme.colorScheme.onBackground.withAlpha(220),
          ),
          Expanded(
            child: Container(
                padding: FxSpacing.fromLTRB(16, 0, 8, 0),
                child: FxText.titleSmall(suggestion, fontWeight: 500)),
          )
        ],
      ),
    );
  }
}
