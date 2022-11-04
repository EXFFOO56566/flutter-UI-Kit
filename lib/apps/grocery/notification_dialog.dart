import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: FxText.titleMedium("Notification", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: FxSpacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: 24,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: FxSpacing.all(16),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FxText.bodyLarge(
                    "Offers",
                    fontWeight: 600,
                  ),
                  FxContainer.rounded(
                    margin: FxSpacing.left(8),
                    width: 18,
                    paddingAll: 0,
                    height: 18,
                    color: customTheme.groceryPrimary.withAlpha(40),
                    child: Center(
                        child: FxText.labelSmall(
                      "2",
                      fontWeight: 600,
                      color: customTheme.groceryPrimary,
                    )),
                  )
                ],
              ),
            ),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-5.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: FxTextStyle.labelMedium(
                            color: customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                      text: "in ultraboost all puma ltd shoes",
                      style: FxTextStyle.labelMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    )
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-2.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: FxTextStyle.labelMedium(
                            color: customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in all cake till 31 july",
                        style: FxTextStyle.labelMedium(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.bodyLarge(
                  "Orders",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: FxSpacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.labelSmall(
                    "8",
                    fontWeight: 600,
                    color: customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-3.png',
                text: FxText.labelMedium(
                    "Your cake order has been delivered at Himalaya",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "Just Now"),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/product-2.png',
                text: FxText.labelMedium(
                    "last order has been cancelled by seller",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "14 July"),
            FxSpacing.height(24),
            Center(
              child: FxButton.text(
                splashColor: customTheme.groceryPrimary.withAlpha(40),
                child: FxText.labelMedium("View all",
                    color: customTheme.groceryPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.2),
                onPressed: () {},
              ),
            ),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.bodyLarge(
                  "Security",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: FxSpacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.labelSmall(
                    "1",
                    fontWeight: 600,
                    color: customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/images/apps/grocery/profile.png',
                text: FxText.labelMedium(
                    "Your account password has been changed",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "2 days ago"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FxContainer.rounded(
            width: 52,
            height: 52,
            padding: FxSpacing.all(10),
            color: customTheme.groceryPrimary.withAlpha(40),
            child: Image.asset(image),
          ),
          Expanded(
            child: Container(margin: FxSpacing.horizontal(16), child: text),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FxText.bodySmall(time,
                  muted: true, fontWeight: 500, letterSpacing: -0.2),
            ],
          )
        ],
      ),
    );
  }
}
