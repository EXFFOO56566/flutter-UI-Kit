import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'add_card_screen.dart';
import 'category_screen.dart';
import 'chat_screen.dart';
import 'favourite_screen.dart';
import 'mega_menu_screen.dart';
import 'order_screen.dart';

class ShoppingProfileScreen extends StatefulWidget {
  final BuildContext root;

  const ShoppingProfileScreen({Key? key, required this.root}) : super(key: key);

  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding:
          FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
      children: <Widget>[
        Column(
          children: <Widget>[
            FxContainer.rounded(
              paddingAll: 0,
              width: 80,
              height: 80,
              child: Image(
                  image: AssetImage("./assets/images/profile/avatar_3.jpg"),
                  fit: BoxFit.fill),
            ),
            FxSpacing.height(8),
            FxText.titleMedium("Derrick Malone",
                fontWeight: 600, letterSpacing: 0),
          ],
        ),
        FxSpacing.height(24),
        FxContainer(
          color: theme.colorScheme.primary,
          padding: FxSpacing.xy(16, 8),
          borderRadiusAll: 4,
          child: Row(
            children: <Widget>[
              Icon(MdiIcons.informationOutline,
                  color: theme.colorScheme.onPrimary, size: 18),
              FxSpacing.width(16),
              Expanded(
                child: FxText.bodyMedium("Gold member",
                    color: FxColorUtils.goldColor,
                    fontWeight: 600,
                    letterSpacing: 0.2),
              ),
              FxSpacing.width(16),
              FxText.bodySmall(
                "Upgrade",
                fontWeight: 600,
                letterSpacing: 0.2,
                color: theme.colorScheme.onPrimary,
              )
            ],
          ),
        ),
        FxSpacing.height(24),
        Column(
          children: <Widget>[
            singleOption(
                iconData: MdiIcons.shapeOutline,
                option: "Category",
                navigation: ShoppingCategoryScreen()),
            Divider(),
            singleOption(
                iconData: MdiIcons.contentPaste,
                option: "History",
                navigation: ShoppingOrderScreen()),
            Divider(),
            singleOption(
                iconData: MdiIcons.heartOutline,
                option: "Favourite",
                navigation: ShoppingFavouriteScreen()),
            Divider(),
            singleOption(
                iconData: MdiIcons.creditCardOutline,
                option: "Payment",
                navigation: ShoppingAddCardScreen()),
            Divider(),
            singleOption(
                iconData: MdiIcons.menu,
                option: "Mega Menu",
                navigation: ShoppingMegaMenuScreen()),
            Divider(),
            singleOption(
                iconData: MdiIcons.faceAgent,
                option: "Help \& Support",
                navigation: ShoppingChatScreen()),
            FxSpacing.height(24),
            Center(
              child: FxButton(
                elevation: 0,
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MdiIcons.logoutVariant,
                      color: theme.colorScheme.onPrimary,
                      size: 18,
                    ),
                    FxSpacing.width(16),
                    FxText.bodySmall("LOGOUT",
                        letterSpacing: 0.3,
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary)
                  ],
                ),
                onPressed: () {
                  Navigator.pop(widget.root);
                },
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: FxSpacing.y(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation!));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: 22,
                color: theme.colorScheme.onBackground,
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: FxText.bodyLarge(option, fontWeight: 600),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: 22, color: theme.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
