import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventCreateScreen extends StatefulWidget {
  @override
  _EventCreateScreenState createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _simpleChoice = ["Change place", "Add another", "Remove"];
  bool _switch = true;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
              children: [
                Container(
                  margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Image(
                            image: AssetImage(
                                './assets/images/profile/avatar_4.jpg'),
                            width: 44,
                            height: 44,
                          ),
                        ),
                      ),
                      Container(
                        margin: FxSpacing.left(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodyMedium("Becky Parra",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            FxText("Create new event",
                                color: customTheme.colorSuccess,
                                fontWeight: 500),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 8, 24, 0),
                  child: TextFormField(
                    style: FxTextStyle.headlineSmall(
                        color: theme.colorScheme.onBackground,
                        letterSpacing: -0.4,
                        fontWeight: 800),
                    decoration: InputDecoration(
                      fillColor: theme.colorScheme.background,
                      hintStyle: FxTextStyle.headlineSmall(
                          color: theme.colorScheme.onBackground,
                          letterSpacing: -0.4,
                          fontWeight: 800),
                      filled: false,
                      hintText: "Event title",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    style: FxTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Description",
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                locationWidget(),
                eventTypeWidget(),
                inviteWidget()
              ],
            ),
          ),
          Container(
            color: customTheme.card,
            padding: FxSpacing.fromLTRB(24, 16, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "\$99",
                        style: FxTextStyle.bodyLarge(
                            fontWeight: 700,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary)),
                    TextSpan(
                        text: " /per person",
                        style: FxTextStyle.bodySmall(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                        )),
                  ]),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(8, 8, 8, 8),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    children: [
                      Container(
                        margin: FxSpacing.left(12),
                        child: FxText.bodySmall("Create".toUpperCase(),
                            fontSize: 12,
                            letterSpacing: 0.7,
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 600),
                      ),
                      Container(
                        margin: FxSpacing.left(16),
                        padding: FxSpacing.all(4),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            shape: BoxShape.circle),
                        child: Icon(
                          MdiIcons.chevronRight,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget locationWidget() {
    return Container(
      margin: FxSpacing.fromLTRB(24, 24, 24, 0),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
            child: Image(
              image: AssetImage('./assets/images/apps/event/pattern-1.png'),
              height: 72,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleSmall("Flutter Academy",
                      fontWeight: 600, color: theme.colorScheme.onBackground),
                  Container(
                    margin: FxSpacing.top(2),
                    child: FxText.bodySmall("8:00 - 11:00 AM",
                        fontSize: 12,
                        fontWeight: 600,
                        color: theme.colorScheme.onBackground,
                        xMuted: true),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return _simpleChoice.map((String choice) {
                  return PopupMenuItem(
                    height: 36,
                    value: choice,
                    child: FxText.bodyMedium(
                      choice,
                      color: theme.colorScheme.onBackground,
                    ),
                  );
                }).toList();
              },
              color: customTheme.card,
              icon: Icon(
                MdiIcons.chevronDown,
                color: theme.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventTypeWidget() {
    return Container(
      margin: FxSpacing.fromLTRB(24, 24, 24, 0),
      padding: FxSpacing.fromLTRB(16, 16, 8, 16),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyLarge("Public event",
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  margin: FxSpacing.top(2),
                  child: FxText.bodySmall("Add event to the public feed",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true),
                ),
              ],
            ),
          )),
          Container(
            child: Switch(
              onChanged: (bool value) {
                setState(() {
                  _switch = value;
                });
              },
              value: _switch,
              activeColor: theme.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }

  Widget inviteWidget() {
    return Container(
      margin: FxSpacing.fromLTRB(24, 24, 24, 0),
      padding: FxSpacing.all(16),
      decoration: BoxDecoration(
          color: customTheme.card,
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          Row(
            children: [
              FxText.bodyMedium("Invite Friends",
                  color: theme.colorScheme.onBackground, fontWeight: 600)
            ],
          ),
          Container(
            margin: FxSpacing.top(16),
            child: singleFriend(
                isSelected: true,
                name: "Trinity Knights",
                image: './assets/images/profile/avatar_5.jpg'),
          ),
          Container(
            margin: FxSpacing.top(12),
            child: singleFriend(
                isSelected: false,
                name: "Cara Beck",
                image: './assets/images/profile/avatar_2.jpg'),
          ),
          Container(
            margin: FxSpacing.top(12),
            child: singleFriend(
                isSelected: true,
                name: "Ayat Huber",
                image: './assets/images/profile/avatar_3.jpg'),
          ),
          Container(
            margin: FxSpacing.top(12),
            child: Row(
              children: [
                Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(32),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: FxText.bodyMedium("48",
                          color: theme.colorScheme.primary, fontWeight: 800),
                    )),
                Expanded(
                  child: Container(
                    margin: FxSpacing.left(16),
                    child: FxText.bodyMedium("Invite more",
                        fontWeight: 600,
                        color: theme.colorScheme.onBackground.withAlpha(220)),
                  ),
                ),
                Container(
                  child: Icon(
                    MdiIcons.chevronRight,
                    size: 20,
                    color: theme.colorScheme.onBackground.withAlpha(200),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleFriend(
      {required String image, required String name, required bool isSelected}) {
    return Container(
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image(
                image: AssetImage(image),
                width: 38,
                height: 38,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: FxText.bodyMedium(name,
                  fontWeight: 600,
                  color: isSelected
                      ? customTheme.colorSuccess.withAlpha(220)
                      : theme.colorScheme.onBackground.withAlpha(180)),
            ),
          ),
          Container(
            child: Icon(
              MdiIcons.check,
              size: 20,
              color: isSelected
                  ? customTheme.colorSuccess.withAlpha(240)
                  : theme.colorScheme.onBackground.withAlpha(100),
            ),
          )
        ],
      ),
    );
  }
}
