import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatContactScreen extends StatefulWidget {
  @override
  _ChatContactScreenState createState() => _ChatContactScreenState();
}

class _ChatContactScreenState extends State<ChatContactScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _list = List.generate(6, (index) => false);
  }

  late List<bool> _list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                FeatherIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
                size: 22,
              )),
          title: FxText.titleMedium("Contacts",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: [
            FxContainer(
              margin: FxSpacing.fromLTRB(20, 0, 20, 0),
              borderRadiusAll: 4,
              paddingAll: 8,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextFormField(
                        style: FxTextStyle.bodyMedium(
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Search messages",
                          hintStyle: FxTextStyle.bodyMedium(
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide.none),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        MdiIcons.magnify,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  singleContact(
                      clickedOption: "Invited",
                      index: 0,
                      image: './assets/images/profile/avatar_2.jpg',
                      isActive: true,
                      name: 'Reanne Dudley',
                      option: "Invite",
                      status: "3 Mutual friends"),
                  singleContact(
                      clickedOption: "Invited",
                      index: 1,
                      image: './assets/images/profile/avatar_1.jpg',
                      name: 'Calista Garcia',
                      option: "Invite",
                      status: "8 Mutual friends"),
                  singleContact(
                      clickedOption: "Invited",
                      index: 2,
                      image: './assets/images/profile/avatar_3.jpg',
                      name: 'Samson Bains',
                      option: "Invite",
                      status: "9 Mutual friends"),
                  singleContact(
                      clickedOption: "Cancel Request",
                      index: 3,
                      image: './assets/images/profile/avatar_4.jpg',
                      name: 'Andrei Ratcliffe',
                      option: "Send Request",
                      isActive: true,
                      status: "Unknown"),
                  singleContact(
                      clickedOption: "Cancel Request",
                      index: 4,
                      image: './assets/images/profile/avatar_5.jpg',
                      name: 'Lowri Gould',
                      option: "Send Request",
                      status: "Unknown"),
                  singleContact(
                      clickedOption: "Cancel Request",
                      index: 5,
                      image: './assets/images/profile/avatar.jpg',
                      name: 'Samson Bains',
                      option: "Send Request",
                      isActive: true,
                      status: "Unknown"),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 12, 16, 0),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Icon(
                      FeatherIcons.share2,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    title: FxText.bodyLarge("Invite Friends",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 600),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      FeatherIcons.helpCircle,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    title: FxText.bodyLarge("Contacts Help",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 600),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleContact(
      {required String image,
      required int index,
      required String name,
      required String status,
      String? option,
      String? clickedOption,
      bool isActive = false}) {
    return Container(
      margin: FxSpacing.bottom(20),
      child: InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    image: AssetImage(image),
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: customTheme.card, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: customTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyLarge(name,
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    FxText.bodySmall(
                      status,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                      fontWeight: 600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: Container(
                padding: FxSpacing.fromLTRB(12, 8, 12, 8),
                decoration: _list[index]
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        border: Border.all(
                          color: customTheme.border,
                        ))
                    : BoxDecoration(
                        color: customTheme.border,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                child: FxText.bodySmall(
                    _list[index] ? clickedOption.toString() : option.toString(),
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodySmall("NAME",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          FxText.bodyLarge("Elysia Baldwin",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodySmall("CITY",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          FxText.bodyLarge("Dubai",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodySmall("EMAIL",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          FxText.bodyLarge("elysin12@gmail.com",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodySmall("NUMBER",
                              fontSize: 12,
                              fontWeight: 700,
                              muted: true,
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.5),
                          FxText.bodyLarge("(91) 9876543210",
                              fontWeight: 600,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    FxSpacing.xy(16, 0))),
                            onPressed: () {},
                            child: FxText.bodyMedium("Send Message",
                                fontWeight: 600,
                                color: theme.colorScheme.onPrimary),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: FxText.bodyMedium("Cancel Request",
                                fontWeight: 600,
                                color: theme.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
