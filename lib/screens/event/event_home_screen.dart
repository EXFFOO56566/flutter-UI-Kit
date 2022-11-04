import 'package:flutkit/screens/event/event_filter_dialog.dart';
import 'package:flutkit/screens/event/event_single_event_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int? selectedCategory = 0;

  Widget build(BuildContext context) {
    return ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      children: [
        Container(
          margin: FxSpacing.fromLTRB(24, 0, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodyMedium("Today 24 Aug, 2020",
                        fontWeight: 400,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground),
                    Container(
                      child: FxText.headlineSmall("Discover Events",
                          fontSize: 24,
                          fontWeight: 700,
                          letterSpacing: -0.3,
                          color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  FxContainer(
                    padding: FxSpacing.all(10),
                    borderRadiusAll: 4,
                    child: Icon(
                      MdiIcons.bell,
                      size: 18,
                      color: theme.colorScheme.onBackground.withAlpha(160),
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: customTheme.colorError,
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
              FxContainer.none(
                margin: FxSpacing.left(16),
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                  width: 36,
                  height: 36,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 24, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: FxSpacing.vertical(4),
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      border: Border.all(color: customTheme.border, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(
                    children: [
                      Container(
                        margin: FxSpacing.left(12),
                        child: Icon(
                          MdiIcons.magnify,
                          color: theme.colorScheme.onBackground.withAlpha(200),
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: FxSpacing.left(12),
                          child: TextFormField(
                            style: FxTextStyle.bodyMedium(
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              fillColor: customTheme.card,
                              hintStyle: FxTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  muted: true,
                                  fontWeight: 500),
                              hintText: "Find Events...",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FxContainer(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => EventFilterDialog());
                },
                margin: FxSpacing.left(16),
                padding: FxSpacing.all(12),
                borderRadiusAll: 4,
                color: theme.colorScheme.primary,
                child: Icon(
                  MdiIcons.tune,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(8),
          padding: FxSpacing.vertical(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: FxSpacing.left(12),
                  child: singleCategory(
                      title: "All", iconData: MdiIcons.ballotOutline, index: 0),
                ),
                singleCategory(
                    title: "Birthday",
                    iconData: MdiIcons.cakeVariant,
                    index: 1),
                singleCategory(
                    title: "Party", iconData: MdiIcons.partyPopper, index: 2),
                singleCategory(
                    title: "Talks", iconData: MdiIcons.chatOutline, index: 3),
                Container(
                  margin: FxSpacing.right(24),
                  child: singleCategory(
                      title: "Food", iconData: MdiIcons.food, index: 4),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 4, 24, 0),
          child: Row(
            children: [
              Expanded(
                child: FxText.titleMedium("Popular",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              FxText.bodySmall("View All",
                  fontWeight: 600, color: theme.colorScheme.primary),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.top(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: FxSpacing.left(24),
                  child: singleEvent(
                      title: "Flutter Test",
                      image: './assets/images/apps/event/pattern-1.png',
                      date: "04",
                      month: "May",
                      subject: "California, US",
                      time: "07:30 PM - 09:00 PM",
                      width: MediaQuery.of(context).size.width * 0.6),
                ),
                Container(
                  margin: FxSpacing.left(16),
                  child: singleEvent(
                      title: "Flutter Dev",
                      image: './assets/images/apps/social/post-l1.jpg',
                      date: "29",
                      month: "Feb",
                      subject: "California, US",
                      time: "07:30 PM - 09:00 PM",
                      width: MediaQuery.of(context).size.width * 0.6),
                ),
                Container(
                  margin: FxSpacing.fromLTRB(16, 0, 24, 0),
                  child: singleEvent(
                      title: "Flutter Test",
                      image: './assets/images/apps/event/pattern-1.png',
                      date: "04",
                      month: "May",
                      subject: "California, US",
                      time: "07:30 PM - 09:00 PM",
                      width: MediaQuery.of(context).size.width * 0.6),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 0),
          child: FxText.titleMedium("This Weekend",
              fontWeight: 700, color: theme.colorScheme.onBackground),
        ),
        Container(
          margin: FxSpacing.fromLTRB(24, 16, 24, 16),
          child: singleEvent(
              title: "Flutter Test",
              image: './assets/images/apps/event/pattern-1.png',
              date: "04",
              month: "May",
              subject: "California, US",
              time: "07:30 PM - 09:00 PM",
              width: MediaQuery.of(context).size.width - 48),
        )
      ],
    );
  }

  Widget singleCategory(
      {IconData? iconData, required String title, int? index}) {
    bool isSelected = (selectedCategory == index);
    return InkWell(
        onTap: () {
          if (!isSelected) {
            setState(() {
              selectedCategory = index;
            });
          }
        },
        child: FxContainer(
          margin: FxSpacing.fromLTRB(12, 8, 0, 8),
          color: isSelected ? theme.colorScheme.primary : customTheme.card,
          bordered: !isSelected,
          border: Border.all(color: customTheme.border),
          borderRadiusAll: 4,
          padding: FxSpacing.fromLTRB(16, 8, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 22,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
              ),
              Container(
                margin: FxSpacing.left(8),
                child: FxText.bodyMedium(title,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onBackground),
              )
            ],
          ),
        ));
  }

  Widget singleEvent(
      {required String image,
      required String date,
      required String month,
      required String title,
      required String subject,
      required String time,
      required double width}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventSingleEventScreen()));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: customTheme.card,
            border: Border.all(color: customTheme.border, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(2)),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      width: width,
                      height: width * 0.55,
                    ),
                  ),
                  Positioned(
                    bottom: -16,
                    left: 16,
                    child: FxContainer.bordered(
                      padding: FxSpacing.fromLTRB(8, 4, 8, 4),
                      borderRadiusAll: 4,
                      child: Column(
                        children: [
                          FxText.bodyMedium(
                            date,
                            color: theme.colorScheme.primary,
                            fontWeight: 600,
                            textAlign: TextAlign.center,
                          ),
                          FxText.bodySmall(
                            month,
                            fontSize: 11,
                            color: theme.colorScheme.primary,
                            fontWeight: 600,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: FxSpacing.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(title,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: FxSpacing.top(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodySmall(subject,
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500,
                                  xMuted: true),
                              Container(
                                margin: FxSpacing.top(2),
                                child: FxText.bodySmall(time,
                                    fontSize: 10,
                                    color: theme.colorScheme.onBackground,
                                    fontWeight: 500,
                                    xMuted: true),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            MdiIcons.heartOutline,
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
      ),
    );
  }
}
