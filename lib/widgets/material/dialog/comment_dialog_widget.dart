/*
* File : Comment Dialog
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommentDialogWidget extends StatefulWidget {
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _CommentDialog());
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
          title: FxText.titleMedium("Comment", fontWeight: 600),
        ),
        body: FxContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage('./assets/images/all/all-l3.jpg'),
                height: 220,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: 4, right: 12, top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium('At Mountain', fontWeight: 700),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: FxText.bodyMedium(
                          'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                          fontWeight: 500),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MdiIcons.heart,
                            color: theme.colorScheme.secondary,
                            size: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: FxText.bodySmall(220.toString(),
                                fontWeight: 600),
                          ),
                          InkWell(
                            onTap: () {
                              _showDialog();
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Icon(
                                      MdiIcons.comment,
                                      color: theme.colorScheme.primary,
                                      size: 20,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: FxText.bodySmall('Comment',
                                      fontWeight: 600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _CommentDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  MdiIcons.thumbUpOutline,
                  color: theme.colorScheme.primary,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: RichText(
                    text: TextSpan(
                        style: FxTextStyle.bodySmall(fontWeight: 500),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Will Allen",
                              style: FxTextStyle.bodyMedium(fontWeight: 700)),
                          TextSpan(text: " and "),
                          TextSpan(
                              text: "17 others",
                              style: FxTextStyle.bodyMedium(fontWeight: 700)),
                          TextSpan(text: " like this."),
                        ]),
                  ),
                )
              ],
            ),
            Divider(),
            _SingleComment(
              name: 'Hamaad Brock',
              image: './assets/images/profile/avatar_3.jpg',
              comment: 'It\'s cool',
              time: '1 hour ago',
            ),
            _SingleComment(
              name: 'Roseanna Rowe',
              image: './assets/images/profile/avatar_4.jpg',
              comment: 'Niceeeee',
              time: '5 hour ago',
            ),
            _SingleComment(
              name: 'Zidane Brewer',
              image: './assets/images/profile/avatar_2.jpg',
              comment: 'Lorem ipsum, or lipsum as it is sometimes known',
              time: '3 days ago',
            ),
            Container(
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: FxText.labelMedium("View All",
                        fontWeight: 600, color: theme.colorScheme.primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleComment extends StatelessWidget {
  final String name, image, comment, time;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleSmall(
                    name,
                    fontWeight: 700,
                  ),
                  FxText.bodyMedium(
                    comment,
                    fontWeight: 500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: <Widget>[
                      FxText.bodySmall(time, fontWeight: 400, height: 1.2),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: FxText.bodyMedium('Like',
                              color: theme.colorScheme.primary,
                              fontWeight: 500)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  const _SingleComment(
      {Key? key,
      required this.name,
      required this.image,
      required this.comment,
      required this.time})
      : super(key: key);
}
