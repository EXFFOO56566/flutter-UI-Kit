import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GroceryOrderScreen extends StatefulWidget {
  @override
  _GroceryOrderScreenState createState() => _GroceryOrderScreenState();
}

class _GroceryOrderScreenState extends State<GroceryOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
            title: FxText.titleMedium("Orders", fontWeight: 600),
          ),
          body: Container(
            child: ListView(
              padding: FxSpacing.fromLTRB(24, 8, 24, 0),
              children: [
                singleOrderItem(
                    price: 49.49,
                    time: "12 April 2020, 1:45",
                    listItem: [
                      "./assets/images/apps/grocery/product-1.png",
                      "./assets/images/apps/grocery/product-2.png",
                      "./assets/images/apps/grocery/product-3.png",
                      "./assets/images/apps/grocery/product-4.png",
                    ],
                    number: 4568,
                    status: "In Progress"),
                singleOrderItem(
                    price: 54.99,
                    time: "14 Feb 2020, 12:04",
                    listItem: [
                      "./assets/images/apps/grocery/product-5.png",
                      "./assets/images/apps/grocery/product-3.png",
                    ],
                    number: 1478,
                    status: "Delivered"),
                singleOrderItem(
                    price: 69.99,
                    time: "16 Dec 2019, 8:48",
                    listItem: [
                      "./assets/images/apps/grocery/product-4.png",
                      "./assets/images/apps/grocery/product-1.png",
                      "./assets/images/apps/grocery/product-2.png",
                    ],
                    number: 1123,
                    status: "Delivered"),
              ],
            ),
          )),
    );
  }

  Widget singleOrderItem(
      {required List<String> listItem,
      int? number,
      String? time,
      String? status,
      double? price}) {
    //Logic for row items
    double space = 16;

    List<Widget> _itemWidget = [];
    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        _itemWidget.add(
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              color: customTheme.groceryPrimary.withAlpha(40),
              height: 80,
              width: 80,
              child: Center(
                  child: FxText.titleMedium(
                      "+" + (listItem.length - 2).toString(),
                      letterSpacing: 0.5,
                      color: customTheme.groceryPrimary,
                      fontWeight: 600)),
            ),
          ),
        );
        break;
      } else {
        _itemWidget.add(
          FxContainer(
            margin: (i == 2) ? FxSpacing.zero : FxSpacing.right(space),
            padding: FxSpacing.all(12),
            color: customTheme.groceryPrimary.withAlpha(40),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                listItem[i],
                height: 56,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return FxContainer(
      padding: FxSpacing.all(16),
      margin: FxSpacing.bottom(16),
      color: customTheme.card,
      bordered: true,
      border: Border.all(color: customTheme.border, width: 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyLarge("Order $number",
                        fontWeight: 600, letterSpacing: -0.2),
                    FxSpacing.height(4),
                    FxText.bodyMedium(
                      "\$ $price",
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
              FxContainer(
                padding: FxSpacing.fromLTRB(12, 8, 12, 8),
                color: customTheme.card,
                borderRadiusAll: 4,
                child: FxText.labelSmall(status!.toUpperCase(),
                    fontWeight: 700, letterSpacing: 0.2),
              )
            ],
          ),
          FxSpacing.height(16),
          FxText.bodySmall(
            time!,
            muted: true,
          ),
          FxSpacing.height(16),
          Wrap(
            children: _itemWidget,
          ),
        ],
      ),
    );
  }
}
