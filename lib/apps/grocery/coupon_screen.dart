import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GroceryCouponScreen extends StatefulWidget {
  @override
  _GroceryCouponScreenState createState() => _GroceryCouponScreenState();
}

class _GroceryCouponScreenState extends State<GroceryCouponScreen> {
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
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                MdiIcons.chevronLeft,
                size: 20,
              ),
            ),
            title: FxText.titleMedium("Coupons", fontWeight: 600),
          ),
          body: Container(
            child: ListView(
              padding: FxSpacing.fromLTRB(24, 8, 24, 0),
              children: <Widget>[
                singleCoupon(MdiIcons.skype, CustomTheme.blue, "Skype", "Shoes",
                    80, "VIABILITY50"),
                // Space.height(24),
                singleCoupon(MdiIcons.spotify, CustomTheme.green, "Spotify",
                    "Songs", 30, "SPOTIFY70"),
                // Space.height(24),
                singleCoupon(MdiIcons.cart, CustomTheme.purple, "Cart", "Shop",
                    60, "CART30"),
                // Space.height(24),
                singleCoupon(MdiIcons.sonyPlaystation, CustomTheme.orange,
                    "Sony", "PS5", 35, "SPS35"),
              ],
            ),
          )),
    );
  }

  Widget singleCoupon(IconData iconData, Color color, String company,
      String product, int offer, String code) {
    return FxContainer(
      margin: FxSpacing.bottom(16),
      padding: FxSpacing.all(16),
      color: customTheme.card,
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: FxSpacing.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color.withAlpha(200)),
                child: Icon(
                  iconData,
                  color: customTheme.groceryOnPrimary,
                ),
              ),
              FxSpacing.height(8),
              FxText.bodyLarge(company, fontWeight: 600),
              FxSpacing.height(4),
              FxText.bodySmall(
                product,
                fontWeight: 500,
                muted: true,
              ),
            ],
          ),
          FxSpacing.width(16),
          FxDottedLine(
            color: theme.colorScheme.onBackground.withAlpha(100),
            height: 100,
            strokeWidth: 1.2,
            dottedLength: 8,
            space: 4,
          ),
          FxSpacing.width(16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.titleLarge(offer.toString() + "%", fontWeight: 700),
                  FxText.bodyMedium("off", fontWeight: 600, xMuted: true),
                ],
              ),
              FxSpacing.height(24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall("Promo code:",
                      xMuted: true, letterSpacing: -0.2),
                  FxSpacing.width(8),
                  FxContainer(
                    padding: FxSpacing.fromLTRB(12, 8, 12, 8),
                    borderRadiusAll: 4,
                    color: customTheme.groceryPrimary.withAlpha(40),
                    child: FxText.bodySmall(
                      code,
                      letterSpacing: 0,
                      fontWeight: 600,
                      color: customTheme.groceryPrimary,
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
