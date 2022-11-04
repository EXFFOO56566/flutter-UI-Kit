import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/screens/event/event_ticket_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'event_ticket_dialog.dart';

class EventUpcomingScreen extends StatefulWidget {
  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedCategory = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: FxText.titleMedium("Upcoming",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: [
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 1"),
            Container(
                margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 2"),
            Container(
                margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 3"),
            Container(
                margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
            singleEvent(
                image: './assets/images/apps/event/pattern-1.png',
                time: "08:15 PM",
                date: "Fri, Apr 12, 2020",
                name: "Flutter Meet 4"),
            Container(
                margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                child: Divider(
                  height: 0,
                )),
          ],
        ));
  }

  Widget singleEvent(
      {required String image,
      required String name,
      required String date,
      required String time}) {
    return Container(
      margin: FxSpacing.all(24),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EventTicketScreen()));
        },
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage(image),
                  width: 100,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleSmall(name,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    EventTicketDialog());
                          },
                          child: Container(
                            padding: FxSpacing.all(6),
                            child: Icon(
                              MdiIcons.qrcode,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(200),
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodySmall("Date",
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  fontSize: 12,
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true),
                              Container(
                                margin: FxSpacing.top(2),
                                child: FxText.bodyMedium(date,
                                    color: theme.colorScheme.onBackground),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodySmall("Time",
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground,
                                  fontSize: 12,
                                  xMuted: true),
                              Container(
                                margin: FxSpacing.top(2),
                                child: FxText.bodyMedium(time,
                                    color: theme.colorScheme.onBackground),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
