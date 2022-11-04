import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatCreateGroupScreen extends StatefulWidget {
  @override
  _ChatCreateGroupScreenState createState() => _ChatCreateGroupScreenState();
}

class _ChatCreateGroupScreenState extends State<ChatCreateGroupScreen> {
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
          title: FxText.titleMedium("Create Group",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
        ),
        body: Column(
          children: [
            FxContainer(
              margin: FxSpacing.fromLTRB(20, 0, 20, 0),
              borderRadiusAll: 4,
              paddingAll: 8,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
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
            Expanded(
              child: Container(
                margin: FxSpacing.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  padding: FxSpacing.zero,
                  children: [
                    singleContact(
                        clickedOption: "Added",
                        index: 3,
                        image: './assets/images/profile/avatar_4.jpg',
                        name: 'Andrei Ratcliffe',
                        option: "Add",
                        isActive: true,
                        status: "2 Mutual groups"),
                    singleContact(
                        clickedOption: "Added",
                        index: 4,
                        image: './assets/images/profile/avatar_5.jpg',
                        name: 'Lowri Gould',
                        option: "Add",
                        status: "3 Mutual groups"),
                    singleContact(
                        clickedOption: "Added",
                        index: 5,
                        image: './assets/images/profile/avatar.jpg',
                        name: 'Samson Bains',
                        option: "Add",
                        isActive: true,
                        status: "1 Mutual group"),
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
                        status: "Unknown"),
                  ],
                ),
              ),
            ),
            FxContainer.bordered(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              padding: FxSpacing.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        singleOption(
                            option: "Profile", iconData: MdiIcons.imageOutline),
                        singleOption(
                            option: "Setting", iconData: MdiIcons.cogOutline),
                        singleOption(
                            option: "Copy", iconData: MdiIcons.contentCopy),
                      ],
                    ),
                  ),
                  Container(
                    margin: FxSpacing.top(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: customTheme.card,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            padding: FxSpacing.all(6),
                            child: TextFormField(
                              style: FxTextStyle.bodyMedium(
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Group Name",
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
                                contentPadding: FxSpacing.fromLTRB(8, 8, 8, 8),
                              ),
                              textInputAction: TextInputAction.search,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                        ),
                        Container(
                          margin: FxSpacing.left(20),
                          child: Container(
                            height: 44,
                            width: 44,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Container(
                                padding: FxSpacing.all(4),
                                child: Icon(MdiIcons.check,
                                    color: theme.colorScheme.onPrimary),
                              ),
                              backgroundColor: theme.colorScheme.primary,
                              mini: true,
                            ),
                          ),
                        )
                      ],
                    ),
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
      margin: FxSpacing.top(20),
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
                        bottom: 4,
                        right: 4,
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
                    FxText.bodyLarge(
                      name,
                    ),
                    FxText.bodySmall(
                      status,
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
                padding: FxSpacing.fromLTRB(16, 8, 16, 8),
                decoration: _list[index]
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                          color: customTheme.border,
                        ))
                    : BoxDecoration(
                        color: customTheme.card,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                child: FxText.bodySmall(_list[index] ? clickedOption! : option!,
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
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
                      margin: FxSpacing.top(20),
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
                      margin: FxSpacing.top(20),
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
                      margin: FxSpacing.top(20),
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
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FxButton(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {},
                          child: FxText(
                            "Add to Group",
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        FxButton.text(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {},
                          child: FxText.bodyMedium("Cancel Request",
                              fontWeight: 600,
                              color: theme.colorScheme.primary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget singleOption({IconData? iconData, required String option}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 120) / 3,
      padding: FxSpacing.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.primary.withAlpha(28),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Icon(
            iconData,
            color: theme.colorScheme.primary,
            size: 22,
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.bodyMedium(option,
                color: theme.colorScheme.primary, fontWeight: 500),
          )
        ],
      ),
    );
  }
}
