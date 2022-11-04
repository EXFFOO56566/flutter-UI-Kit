import 'package:flutkit/screens/food/food_menu_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoodRestaurantScreen extends StatefulWidget {
  @override
  _FoodRestaurantScreenState createState() => _FoodRestaurantScreenState();
}

class _FoodRestaurantScreenState extends State<FoodRestaurantScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool isQuick = false;

  int selectedAddress = 0;

  int selectedSize = 0;
  bool toppingCheese = false,
      toppingTomato = true,
      toppingCorn = false,
      toppingChicken = false;

  int getPrice() {
    return 29 * (selectedSize + 1) +
        (toppingCheese ? 2 : 0) +
        (toppingTomato ? 3 : 0) +
        (toppingCorn ? 5 : 0) +
        (toppingChicken ? 10 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
            child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage('./assets/images/apps/food/restaurant.jpg'),
              fit: BoxFit.fill,
            ),
            Positioned(
                top: 16,
                left: 16,
                child: SafeArea(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: Colors.white,
                      )),
                ))
          ],
        )),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleMedium("The Disaster Café",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodySmall("London bridge",
                      color: theme.colorScheme.onBackground, fontWeight: 400),
                  FxStarRating(
                      rating: 4.5,
                      size: 18,
                      spacing: 0,
                      inactiveColor: theme.colorScheme.onBackground,
                      inactiveStarFilled: false)
                ],
              )),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(40),
                        shape: BoxShape.circle),
                    child: Icon(
                      MdiIcons.phoneOutline,
                      size: 22,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(40),
                        shape: BoxShape.circle),
                    child: Icon(
                      MdiIcons.mapMarkerOutline,
                      size: 22,
                      color: theme.colorScheme.primary,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium("Delivery",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodyLarge("Free",
                      color: theme.colorScheme.onBackground, fontWeight: 500),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium("Time",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  FxText.bodyLarge("9 AM - 7 PM",
                      color: theme.colorScheme.onBackground, fontWeight: 500),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodMenuScreen()));
                  },
                  child: FxText.bodyMedium("MENU",
                      fontWeight: 600, color: theme.colorScheme.primary)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FxText.bodyLarge("Reviews",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
              FxText.bodySmall("View All",
                  color: theme.colorScheme.primary, fontWeight: 500),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            children: <Widget>[
              singleReview(
                  rating: 4.5,
                  image: './assets/images/profile/avatar_2.jpg',
                  time: "27 Jul 2020"),
              Divider(),
              singleReview(
                  rating: 3.8,
                  image: './assets/images/profile/avatar_3.jpg',
                  time: "25 Jul 2020"),
              Divider(),
              singleReview(
                  rating: 5,
                  image: './assets/images/profile/avatar_4.jpg',
                  time: "21 Jul 2020"),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: FxButton.block(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodMenuScreen()));
            },
            child: FxText.bodySmall("Order Now".toUpperCase(),
                letterSpacing: 0.4,
                fontWeight: 600,
                color: theme.colorScheme.onPrimary),
            elevation: 0,
            borderRadiusAll: 4,
          ),
        ),
      ],
    ));
  }

  Widget singleReview(
      {required String image, required double rating, required String time}) {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            child: Image(
              image: AssetImage(image),
              height: 64,
              width: 64,
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FxStarRating(
                            rating: rating,
                            size: 18,
                            inactiveColor: theme.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: FxText.bodySmall(time,
                              fontWeight: 600, muted: true),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: FxText.bodySmall(Generator.getDummyText(12),
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
