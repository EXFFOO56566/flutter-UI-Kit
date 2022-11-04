import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductSoldOutScreen extends StatefulWidget {
  @override
  _ProductSoldOutScreenState createState() => _ProductSoldOutScreenState();
}

class _ProductSoldOutScreenState extends State<ProductSoldOutScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool? checkValue = true;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
        ),
        body: Container(
            child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 64),
                child: FxText.titleLarge(
                  "This item is out of stock",
                  color: theme.colorScheme.onBackground,
                  letterSpacing: 0.3,
                  fontWeight: 600,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64, bottom: 64),
                child: Icon(
                  MdiIcons.emoticonSadOutline,
                  size: 64,
                  color: theme.colorScheme.primary,
                ),
              ),
              FxText.titleSmall(
                "We are sorry,\nThis product cannot be purchased at this time",
                color: theme.colorScheme.onBackground,
                letterSpacing: 0,
                fontWeight: 500,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          checkValue = value;
                        });
                      },
                      value: checkValue,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: FxText.bodyMedium(
                        "Notify me when it available",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0.3,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
