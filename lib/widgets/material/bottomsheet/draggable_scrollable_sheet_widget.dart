/*
* File : Draggable Scrollable Sheet
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DraggableScrollableSheetWidget extends StatefulWidget {
  @override
  _DraggableScrollableSheetWidgetState createState() =>
      _DraggableScrollableSheetWidgetState();
}

class _DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {
  final List<String> _queueChoice = [
    "Move to Top",
    "Move to Bottom",
    "Remove",
    "Download"
  ];

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
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
        title: FxText.titleMedium("Draggable Scrollable", fontWeight: 600),
      ),
      body: Container(
        child: DraggableScrollableSheet(
          initialChildSize: 98 / MediaQuery.of(context).size.height,
          minChildSize: 98 / MediaQuery.of(context).size.height,
          maxChildSize: 0.8,
          builder: (BuildContext context, controller) {
            return _bottomSheet(controller);
          },
        ),
      ),
    );
  }

  Widget _bottomSheet(ScrollController controller) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: controller,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 20),
              decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Center(
                        child: Container(
                      height: 4,
                      width: 40,
                      decoration: new BoxDecoration(
                          color: theme.colorScheme.onBackground.withAlpha(120),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40))),
                    )),
                  ),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image(
                            image: AssetImage(
                                './assets/images/apps/music/event-1.jpg'),
                            fit: BoxFit.cover,
                            height: 56,
                            width: 56,
                          )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.titleMedium("Love me",
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0.15,
                                  fontWeight: 600),
                              FxText.bodyLarge("From older",
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                  letterSpacing: 0.10)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                              backgroundColor: theme.colorScheme.primary,
                              iconColor: theme.colorScheme.onPrimary,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                      side: BorderSide.none),
                                  child: InkWell(
                                    splashColor: theme.colorScheme.primary,
                                    // inkwell color
                                    child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          MdiIcons.skipNextOutline,
                                          color: theme.colorScheme.onBackground,
                                          size: 28,
                                        )),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: theme.backgroundColor,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: FxText.titleSmall("Up Next",
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.2,
                        fontWeight: 600),
                  ),
                  Container(
                    color: theme.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/singer-3.jpg',
                          name: 'Queue one',
                          singer: 'Singer - 1',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/singer-2.jpg',
                          name: 'Queue two',
                          singer: 'Singer - 2',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/singer-1.jpg',
                          name: 'Queue three',
                          singer: 'Singer - 3',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/singer-4.jpg',
                          name: 'Queue four',
                          singer: 'Singer - 4',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/event-1.jpg',
                          name: 'Queue five',
                          singer: 'Singer - 5',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/apps/music/event-2.jpg',
                          name: 'Queue six',
                          singer: 'Singer - 6',
                          choice: _queueChoice,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleQueueWidget extends StatelessWidget {
  final String image, name, singer;

  final List<String> choice;

  const _SingleQueueWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.singer,
      required this.choice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: 56,
                width: 56,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(name,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.15,
                      fontWeight: 600),
                  FxText.titleSmall(singer,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.10)
                ],
              ),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: theme.primaryColor.withAlpha(16),
                child: InkWell(
                  splashColor: theme.colorScheme.primary.withAlpha(100),
                  highlightColor: theme.primaryColor.withAlpha(16),
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        MdiIcons.heartOutline,
                        color: theme.colorScheme.primary,
                        size: 22,
                      )),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return choice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: FxText.bodyMedium(choice,
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0.2),
                  );
                }).toList();
              },
              icon: Icon(
                MdiIcons.dotsVertical,
                color: theme.colorScheme.onBackground,
              ),
              color: theme.colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final Color backgroundColor, iconColor;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      required this.backgroundColor,
      required this.iconColor})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          elevation: 5,
          color: widget.backgroundColor,
          child: InkWell(
            child: IconButton(
              iconSize: 28,
              icon: AnimatedIcon(
                icon: widget.animatedIconData,
                progress: _animationController,
                color: widget.iconColor,
              ),
              onPressed: () {
                if (isPlaying) {
                  _animationController.reverse();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  _animationController.forward();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
