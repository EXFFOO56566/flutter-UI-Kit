import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'product_screen.dart';

class ShoppingHomeScreen extends StatefulWidget {
  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: FxSpacing.zero,
        children: <Widget>[
          Container(
            padding: FxSpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.titleMedium("Welcome",
                    letterSpacing: 0, fontWeight: 600),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return NotificationDialog();
                        },
                        fullscreenDialog: true));
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
                        child: FxContainer.rounded(
                          padding: FxSpacing.zero,
                          height: 14,
                          width: 14,
                          color: theme.colorScheme.primary,
                          child: Center(
                            child: FxText.labelSmall(
                              "2",
                              color: theme.colorScheme.onPrimary,
                              fontSize: 9,
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
            paddingAll: 16,
            borderRadiusAll: 4,
            margin: FxSpacing.nBottom(24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxContainer(
                          padding: FxSpacing.xy(12, 8),
                          color: theme.colorScheme.primary.withAlpha(28),
                          borderRadiusAll: 4,
                          child: FxText.bodySmall("Trending",
                              color: theme.colorScheme.primary,
                              letterSpacing: 0.3,
                              fontWeight: 600),
                        ),
                        FxText.labelMedium("Colorful Sandal",
                            fontWeight: 600, letterSpacing: 0),
                        FxText.bodySmall("\$ 49.99",
                            fontWeight: 600, letterSpacing: 0)
                      ],
                    ),
                  ),
                ),
                FxContainer(
                  paddingAll: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadiusAll: 4,
                  child: Image(
                    image: AssetImage(
                        './assets/images/apps/shopping/product/product-8.jpg'),
                    width: 125,
                    height: 125,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: FxSpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.bodyLarge("Popular Deals",
                    fontWeight: 600, letterSpacing: 0),
                FxText.bodySmall("View all",
                    color: theme.colorScheme.primary, letterSpacing: 0)
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  margin: FxSpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-10.jpg',
                      name: "Pop corn",
                      rate: 45.99),
                ),
                Container(
                  margin: FxSpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-7.jpg',
                      name: "Cosmic bang",
                      rate: 78.99),
                ),
                Container(
                  margin: FxSpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-5.jpg',
                      name: "Sweet Gems",
                      rate: 35.99),
                ),
                Container(
                  margin: FxSpacing.left(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-2.jpg',
                      name: "Toffees",
                      rate: 28.49),
                ),
                Container(
                  margin: FxSpacing.x(24),
                  child: singleItemWidget(
                      image:
                          './assets/images/apps/shopping/product/product-3.jpg',
                      name: "Candies",
                      rate: 15.99),
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.nBottom(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FxText.bodyLarge("For you", fontWeight: 600, letterSpacing: 0),
                FxText.bodySmall(
                  "View all",
                  letterSpacing: 0,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.nBottom(24),
            child: Column(
              children: <Widget>[
                Container(
                  child: singleForYouWidget(
                    name: "Sweet Gems",
                    image:
                        './assets/images/apps/shopping/product/product-5.jpg',
                    shopName: 'El Primo',
                    star: 4.5,
                    price: 1470,
                  ),
                ),
                Container(
                  child: singleForYouWidget(
                    name: "Lipsticks",
                    image:
                        './assets/images/apps/shopping/product/product-4.jpg',
                    shopName: 'Bee Lipstore',
                    star: 3.8,
                    price: 1486,
                  ),
                ),
                Container(
                  child: singleForYouWidget(
                    name: "Candies",
                    image:
                        './assets/images/apps/shopping/product/product-3.jpg',
                    shopName: 'Bee Lipstore',
                    star: 4,
                    price: 1456,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: FxSpacing.nBottom(24),
            child: FxText.titleMedium("Best sellers",
                fontWeight: 600, letterSpacing: 0),
          ),
          Container(
            margin: FxSpacing.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                singleSellerWidget(
                    image: './assets/images/profile/avatar_1.jpg',
                    name: 'Liss\'s Shop'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_2.jpg',
                    name: 'Ekk Shop'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_3.jpg',
                    name: 'Shop Center'),
                singleSellerWidget(
                    image: './assets/images/profile/avatar_4.jpg',
                    name: 'Sweety')
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget singleItemWidget(
      {required String image, required String name, double? rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                image,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: FxSpacing.top(8),
              child: FxText.bodyMedium(name,
                  letterSpacing: 0, muted: true, fontWeight: 600),
            ),
            FxText.bodyMedium("\$ " + rate.toString()),
          ],
        ),
      ),
    );
  }

  Widget singleSellerWidget({required String image, required String name}) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Image(
              image: AssetImage(image),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          FxSpacing.height(8),
          FxText.bodySmall(name)
        ],
      ),
    );
  }

  Widget singleForYouWidget(
      {required String name,
      required String image,
      required String shopName,
      required double star,
      int? price}) {
    String key = Generator.randomString(10);
    return FxContainer.bordered(
      color: Colors.transparent,
      paddingAll: 16,
      borderRadiusAll: 4,
      margin: FxSpacing.bottom(16),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                image,
                height: 90,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: FxContainer.none(
              height: 90,
              color: Colors.transparent,
              margin: FxSpacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium(
                        name,
                        fontWeight: 600,
                      ),
                      Icon(
                        MdiIcons.heart,
                        color: theme.colorScheme.onBackground.withAlpha(75),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FxStarRating(
                          rating: star,
                          size: 16,
                          inactiveColor: theme.colorScheme.onBackground),
                      Container(
                        margin: FxSpacing.left(8),
                        child:
                            FxText.bodyMedium(star.toString(), fontWeight: 600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.storeOutline,
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            size: 20,
                          ),
                          FxSpacing.width(4),
                          FxText.bodyMedium(shopName)
                        ],
                      ),
                      FxText.bodyMedium("\$ " + price.toString(),
                          fontWeight: 700)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
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
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: theme.colorScheme.primary.withAlpha(40),
                  child: Center(
                      child: FxText.labelSmall(
                    "2",
                    fontWeight: 600,
                    color: theme.colorScheme.primary,
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
                          color: theme.colorScheme.primary,
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
                          color: theme.colorScheme.primary,
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
                color: theme.colorScheme.primary.withAlpha(40),
                child: Center(
                    child: FxText.labelSmall(
                  "8",
                  fontWeight: 600,
                  color: theme.colorScheme.primary,
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
              splashColor: theme.colorScheme.primary.withAlpha(40),
              child: FxText.labelMedium("View all",
                  color: theme.colorScheme.primary,
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
                color: theme.colorScheme.primary.withAlpha(40),
                child: Center(
                    child: FxText.labelSmall(
                  "1",
                  fontWeight: 600,
                  color: theme.colorScheme.primary,
                )),
              )
            ],
          ),
          FxSpacing.height(24),
          singleNotification(
              image: './assets/images/apps/grocery/profile.png',
              text: FxText.labelMedium("Your account password has been changed",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
              time: "2 days ago"),
        ],
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
            color: theme.colorScheme.primary.withAlpha(40),
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
