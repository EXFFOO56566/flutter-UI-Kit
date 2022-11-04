import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'food_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<bool> _dataExpansionPanel = [false, false, true, false, false];

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: FxText.titleLarge("Menu",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: Container(
            color: customTheme.card,
            child: ListView(
              children: <Widget>[
                ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.all(0),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _dataExpansionPanel[index] = !isExpanded;
                    });
                  },
                  animationDuration: Duration(milliseconds: 500),
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: FxText.titleSmall("Pizza",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding:
                              EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              singleMenuItem(
                                  image: './assets/images/apps/food/food-1.jpg',
                                  name: 'Peperoni pizza',
                                  price: 25.99,
                                  rate: 4.5),
                              singleMenuItem(
                                  image: './assets/images/apps/food/food-2.jpg',
                                  name: 'Meat Pizza',
                                  price: 21.99,
                                  rate: 3.5),
                              singleMenuItem(
                                  image: './assets/images/apps/food/food-3.jpg',
                                  name: 'Margherita',
                                  price: 24.79,
                                  rate: 4),
                              singleMenuItem(
                                  image: './assets/images/apps/food/food-4.jpg',
                                  name: 'Hawaiian Pizza',
                                  price: 29.80,
                                  rate: 5),
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[0]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: FxText.titleSmall("Pasta",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding:
                              EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/pasta-1.jpg',
                                  name: 'Peperoni pizza',
                                  price: 25.99,
                                  rate: 4.5),
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[1]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: FxText.titleSmall("Burger",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding:
                              EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/burger-1.jpg',
                                  name: 'Peperoni pizza',
                                  price: 25.99,
                                  rate: 4.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/burger-2.jpg',
                                  name: 'Meat Pizza',
                                  price: 21.99,
                                  rate: 3.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/burger-3.jpg',
                                  name: 'Margherita',
                                  price: 24.79,
                                  rate: 4),
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[2]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: FxText.titleSmall("Beverage",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding:
                              EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/beverage-1.jpg',
                                  name: 'Peperoni pizza',
                                  price: 25.99,
                                  rate: 4.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/beverage-2.jpg',
                                  name: 'Meat Pizza',
                                  price: 21.99,
                                  rate: 3.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/beverage-3.jpg',
                                  name: 'Margherita',
                                  price: 24.79,
                                  rate: 4),
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[3]),
                    ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: FxText.bodyLarge("Dessert",
                                color: isExpanded
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.onBackground,
                                fontWeight: isExpanded ? 700 : 600),
                          );
                        },
                        body: Container(
                          padding:
                              EdgeInsets.only(bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: <Widget>[
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/dessert-1.jpg',
                                  name: 'Peperoni pizza',
                                  price: 25.99,
                                  rate: 4.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/dessert-2.jpg',
                                  name: 'Meat Pizza',
                                  price: 21.99,
                                  rate: 3.5),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/dessert-3.jpg',
                                  name: 'Margherita',
                                  price: 24.79,
                                  rate: 4),
                              singleMenuItem(
                                  image:
                                      './assets/images/apps/food/dessert-4.jpg',
                                  name: 'Hawaiian Pizza',
                                  price: 29.80,
                                  rate: 5),
                            ],
                          ),
                        ),
                        isExpanded: _dataExpansionPanel[4]),
                  ],
                )
              ],
            )));
  }

  Widget singleMenuItem(
      {required String image,
      required String name,
      required double rate,
      double? price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxText.bodyMedium(name,
                        color: theme.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 600),
                    Container(
                        margin: EdgeInsets.only(top: 4),
                        child: FxStarRating(
                            rating: rate,
                            inactiveColor: theme.colorScheme.onBackground,
                            size: 18)),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: FxText.bodyMedium("\$" + price.toString(),
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: theme.colorScheme.onBackground.withAlpha(120),
                      width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: FxText.bodySmall("Add",
                  fontSize: 12,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600),
            )
          ],
        ),
      ),
    );
  }
}
