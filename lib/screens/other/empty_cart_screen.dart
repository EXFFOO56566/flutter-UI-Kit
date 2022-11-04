import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class EmptyCartScreen extends StatefulWidget {
  @override
  _EmptyCartScreenState createState() => _EmptyCartScreenState();
}

class _EmptyCartScreenState extends State<EmptyCartScreen> {
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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Cart", fontWeight: 600),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Image(
                      image: AssetImage(
                        './assets/illustration/shopping/empty-cart.png',
                      ),
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: FxText.titleMedium("Your cart is empty",
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
                      letterSpacing: 0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: FxButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: FxText.bodyMedium("Let's shopping",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.5)),
                )
              ],
            ),
          ),
        ));
  }
}
