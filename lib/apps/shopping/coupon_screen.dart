import 'package:flutkit/screens/other/terms_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingCouponScreen extends StatefulWidget {
  @override
  _ShoppingCouponScreenState createState() => _ShoppingCouponScreenState();
}

class _ShoppingCouponScreenState extends State<ShoppingCouponScreen> {
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
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.titleLarge("Coupons", fontWeight: 600),
        ),
        body: Container(
          child: ListView(
            padding: FxSpacing.x(16),
            children: <Widget>[
              FxText.bodySmall("Active".toUpperCase(),
                  muted: true, fontWeight: 700),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/apps/shopping/offer/offer-1.png",
                  offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                  expireDate: "04 Jun 2020"),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/apps/shopping/offer/offer-1.png",
                  offer: "Gift Card Valued at \$50 or 10% off at all stores",
                  expireDate: "16 July 2020"),
              FxSpacing.height(16),
              FxText.bodySmall("Upcoming".toUpperCase(),
                  muted: true, fontWeight: 700),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/apps/shopping/offer/offer-2.png",
                  offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                  comingDate: "04 Aug 2020",
                  isActive: false),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/apps/shopping/offer/offer-2.png",
                  offer: "Gift Card Valued at \$50 or 10% off at all stores",
                  comingDate: "16 Aug 2020",
                  isActive: false),
            ],
          ),
        ));
  }

  Widget singleCoupon(
      {required String image,
      required String offer,
      String? expireDate,
      bool isActive = true,
      String? comingDate}) {
    return FxContainer(
      paddingAll: 24,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              FxSpacing.width(16),
              Expanded(
                child: FxText.bodyMedium(offer,
                    fontWeight: 600, letterSpacing: 0.2),
              )
            ],
          ),
          FxSpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.bodySmall(
                        isActive ? "Expires" : "Coming at",
                        muted: true,
                      ),
                      FxText.bodyMedium(isActive ? expireDate! : comingDate!,
                          fontWeight: 600),
                      FxSpacing.height(8),
                      FxButton.text(
                        padding: FxSpacing.zero,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsScreen()));
                        },
                        child: FxText.bodySmall("Terms \& Condition Apply",
                            muted: true,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary,
                            fontWeight: 600),
                      )
                    ],
                  ),
                ),
              ),
              FxButton(
                  backgroundColor: theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  elevation: 2,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: FxText.labelMedium(
                    isActive ? "Apply" : "Activate",
                    fontWeight: 600,
                    color: isActive
                        ? theme.colorScheme.onPrimary
                        : customTheme.onDisabled,
                    letterSpacing: 0.5,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
