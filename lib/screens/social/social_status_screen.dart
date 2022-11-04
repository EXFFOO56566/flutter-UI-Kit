import 'dart:async';
import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialStatusScreen extends StatefulWidget {
  @override
  _SocialStatusScreenState createState() => _SocialStatusScreenState();
}

class _SocialStatusScreenState extends State<SocialStatusScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  Timer? _timer;
  int count = 0;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 50),
        (Timer timer) => {
              setState(() {
                if (count < 200) {
                  count++;
                } else {
                  count = 200;
                  timer.cancel();
                }
              })
            });
  }

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: FxSpacing.fromLTRB(
                16, FxSpacing.safeAreaTop(context) + 20, 16, 0),
            child: LinearProgressIndicator(
              backgroundColor: customTheme.card,
              value: count / 200,
              valueColor: new AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.onBackground.withAlpha(120)),
              minHeight: 2.2,
            ),
          ),
          Container(
            margin: FxSpacing.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                    width: 38,
                    height: 38,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: FxSpacing.left(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: FxText.bodyMedium("marcia_hayde",
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground),
                            ),
                            Container(
                              margin: FxSpacing.left(8),
                              child: FxText.bodySmall("10 min",
                                  fontWeight: 600,
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true),
                            ),
                          ],
                        ),
                        Container(
                          margin: FxSpacing.top(2),
                          child: FxText.bodySmall("106 views",
                              xMuted: true, fontSize: 12, fontWeight: 600),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return _simpleChoice.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: FxText.bodyMedium(choice,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.2),
                      );
                    }).toList();
                  },
                  color: theme.backgroundColor,
                  icon: Icon(
                    MdiIcons.dotsVertical,
                    color: theme.colorScheme.onBackground,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.vertical(16),
              child: Image(
                image: AssetImage('./assets/images/apps/social/profile-p1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: FxSpacing.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: FxTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground, fontWeight: 500),
                    decoration: InputDecoration(
                        hintText: "Send message",
                        hintStyle: FxTextStyle.bodyMedium(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        fillColor: customTheme.card,
                        filled: true,
                        isDense: true,
                        contentPadding: FxSpacing.fromLTRB(16, 12, 16, 12)),
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: FxSpacing.left(16),
                  child: Transform.rotate(
                      angle: -pi / 8,
                      child: Icon(
                        MdiIcons.sendOutline,
                        color: theme.colorScheme.onBackground,
                        size: 22,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
