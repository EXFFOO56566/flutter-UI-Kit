import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'food_product_screen.dart';

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 20) / ((width / 2 - 20) + 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          margin: FxSpacing.x(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.titleMedium("Hey hungry",
                  color: theme.colorScheme.onBackground,
                  letterSpacing: 0,
                  fontWeight: 600),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationDialog()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      MdiIcons.bellOutline,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: FxText.labelSmall(
                            "2",
                            color: theme.colorScheme.onPrimary,
                            fontSize: 9,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        FxContainer.bordered(
          color: Colors.transparent,
          paddingAll: 16,
          margin: EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: customTheme.card,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: FxText.bodySmall("Special",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0.3,
                            fontWeight: 600),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FxText.titleSmall("\$ ",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                              letterSpacing: 0),
                          FxText.bodySmall("59",
                              fontSize: 12,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600,
                              muted: true,
                              letterSpacing: 0,
                              decoration: TextDecoration.lineThrough),
                          FxText.titleSmall(" 39",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700,
                              letterSpacing: 0),
                        ],
                      ),
                      FxText.titleSmall("Chinese Nood",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0)
                    ],
                  ),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Image(
                    image: AssetImage('./assets/images/apps/food/food-9.jpg'),
                    width: 125,
                    height: 125,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(20, 20, 20, 0),
          child: FxText.bodyLarge("Category", fontWeight: 600),
        ),
        Container(
          margin: FxSpacing.top(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-5.jpg',
                      title: "Chinese"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-6.jpg',
                      title: "Italian"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-7.jpg',
                      title: "American"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: singleCategory(
                      image: './assets/images/apps/food/food-8.jpg',
                      title: "Punjabi"),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.bodyLarge("Recommended", fontWeight: 600),
              FxText.bodyMedium("View all",
                  color: theme.colorScheme.primary, fontWeight: 500),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: GridView.count(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 16, left: 20, right: 20),
            crossAxisCount: 2,
            childAspectRatio:
                findAspectRatio(MediaQuery.of(context).size.width),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: <Widget>[
              singleFood(
                  image: './assets/images/apps/food/food-1.jpg',
                  name: 'Salad dish',
                  price: 16.59),
              singleFood(
                  image: './assets/images/apps/food/food-2.jpg',
                  name: 'Food dish',
                  price: 29.99),
              singleFood(
                  image: './assets/images/apps/food/food-3.jpg',
                  name: 'Pan Cake',
                  price: 20.29),
              singleFood(
                  image: './assets/images/apps/food/food-7.jpg',
                  name: 'Salad',
                  price: 14.99),
            ],
          ),
        ),
      ],
    ));
  }

  Widget singleFood(
      {required String image, required String name, double? price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: FxContainer.none(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(image),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6, left: 8),
              child: FxText.bodyMedium(name, muted: true, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 2, left: 8),
              child: FxText.bodyMedium("\$" + price.toString(),
                  fontWeight: 500, letterSpacing: 0),
            )
          ],
        ),
      ),
    );
  }

  Widget singleCategory({required String image, required String title}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 140,
              height: 140,
              child: Image(
                image: AssetImage(image),
                width: 140,
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 140,
              height: 140,
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: 140,
              height: 140,
              child: Center(
                child: FxText.titleMedium(title,
                    fontWeight: 600, color: Colors.white, letterSpacing: 0.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          title: FxText.titleLarge("Notifications", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: 20,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: Container(
            color: theme.backgroundColor,
            padding: EdgeInsets.all(16),
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                singleNotification(
                    iconData: MdiIcons.food,
                    time: "Just Now ",
                    text: "Your order placed successfully"),
                singleNotification(
                    iconData: MdiIcons.close,
                    time: "1 Day ago",
                    text: "Your last order cancel due to payment issue"),
                singleNotification(
                    iconData: MdiIcons.check,
                    time: "3 Day ago",
                    text: "Burger order successfully deliver"),
                singleNotification(
                    iconData: MdiIcons.emailOutline,
                    time: "1 Month ago",
                    text: "A new email from restaurant"),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                    child: FxText.bodyMedium("View all",
                        color: theme.colorScheme.primary, fontWeight: 500),
                  ),
                )
              ],
            )));
  }

  Widget singleNotification(
      {IconData? iconData, required String text, required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(color: theme.backgroundColor, boxShadow: [
        BoxShadow(
            color: theme.cardTheme.shadowColor!.withAlpha(12),
            blurRadius: 8,
            offset: Offset(0, 4))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child: Icon(
              iconData,
              color: theme.colorScheme.onPrimary,
              size: 22,
            ),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary, shape: BoxShape.circle),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 18, right: 18),
                child: FxText(text)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FxText.bodySmall(time,
                  color: theme.colorScheme.onBackground,
                  fontSize: 12,
                  muted: true,
                  fontWeight: 500,
                  letterSpacing: -0.2),
            ],
          )
        ],
      ),
    );
  }
}
