import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import 'order_screen.dart';

class GroceryProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryProfileScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryProfileScreenState createState() => _GroceryProfileScreenState();
}

class _GroceryProfileScreenState extends State<GroceryProfileScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
        body: ListView(
      padding: FxSpacing.fromLTRB(24, 72, 24, 70),
      children: [
        Center(
          child: FxContainer.rounded(
            padding: FxSpacing.all(20),
            color: customTheme.groceryPrimary.withAlpha(40),
            child: Image.asset(
              'assets/images/apps/grocery/profile.png',
              width: 60,
              height: 60,
            ),
          ),
        ),
        FxSpacing.height(16),
        Center(
          child: FxText.bodyLarge("Kelvin Gonzalez", fontWeight: 600),
        ),
        FxSpacing.height(32),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroceryOrderScreen()));
            },
            child: getSingleSetting(
                iconData: FeatherIcons.shoppingBag,
                color: CustomTheme.brown,
                title: "My Orders")),
        getSingleSetting(
            iconData: FeatherIcons.creditCard,
            color: CustomTheme.green,
            title: "Wallet"),
        getSingleSetting(
            iconData: FeatherIcons.tag,
            color: CustomTheme.purple,
            title: "Vouchers"),
        getSingleSetting(
            iconData: FeatherIcons.mapPin,
            color: CustomTheme.orange,
            title: "My Address"),
        getSingleSetting(
            iconData: FeatherIcons.logOut,
            color: CustomTheme.red,
            title: "Log Out"),
      ],
    ));
  }

  Widget getSingleSetting(
      {IconData? iconData, required Color color, required String title}) {
    return Container(
      margin: FxSpacing.bottom(16),
      child: Row(
        children: [
          FxContainer(
            color: color.withAlpha(24),
            child: Icon(
              iconData,
              color: color,
              size: 22,
            ),
          ),
          FxSpacing.width(24),
          FxText.bodyLarge(title, letterSpacing: 0.3, fontWeight: 600)
        ],
      ),
    );
  }
}
