import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ShoppingOrderPlaceScreen extends StatefulWidget {
  @override
  _ShoppingOrderPlaceScreenState createState() =>
      _ShoppingOrderPlaceScreenState();
}

class _ShoppingOrderPlaceScreenState extends State<ShoppingOrderPlaceScreen> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ScratchDialog());
  }

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
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage(
                    './assets/illustration/shopping/order-confirm.png'),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            FxSpacing.height(32),
            FxText.bodyMedium(
              "Your order placed successfully",
            ),
            FxSpacing.height(16),
            FxText.bodyMedium(
              "You won a scratch coupon",
            ),
            FxSpacing.height(16),
            FxButton(
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: 4,
                elevation: 0,
                onPressed: () {
                  _showDialog();
                },
                child: FxText.bodyMedium("Scratch",
                    fontWeight: 600, color: theme.colorScheme.onPrimary)),
          ],
        ),
      ),
    ));
  }
}

class _ScratchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Dialog(
      insetPadding: FxSpacing.x(52),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: FxCard(
        padding: FxSpacing.xy(40, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FxText.titleMedium(
              "Congratulations !",
              color: theme.colorScheme.primary,
              fontWeight: 700,
            ),
            FxSpacing.height(16),
            FxText.bodyMedium(
              "Here's the code for your \$50 Puma's Gift Card",
              fontWeight: 600,
              height: 1.2,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxText.titleLarge(
              "SH10USE",
              fontWeight: 800,
              letterSpacing: 0.5,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),
            FxButton(
                borderRadiusAll: 4,
                elevation: 2,
                backgroundColor: theme.colorScheme.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: FxText.labelMedium(
                  "Redeem it".toUpperCase(),
                  fontSize: 13,
                  letterSpacing: 0.5,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                ))
          ],
        ),
      ),
    );
  }
}
