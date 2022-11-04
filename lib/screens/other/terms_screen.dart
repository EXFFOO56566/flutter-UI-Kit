import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => TermsDialog());
  }

  @override
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
        body: Center(
          child: FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                _showDialog();
              },
              child: FxText.bodyMedium("Read Terms",
                  fontWeight: 600, color: theme.colorScheme.onPrimary)),
        ));
  }
}

class TermsDialog extends StatefulWidget {
  @override
  _TermsDialogState createState() => _TermsDialogState();
}

class _TermsDialogState extends State<TermsDialog> {
  bool? isChecked = false;

  late String text1, text2, text3, text4;

  @override
  void initState() {
    super.initState();
    text1 = Generator.getDummyText(16);
    text2 = Generator.getDummyText(12);
    text3 = Generator.getDummyText(20);
    text4 = Generator.getDummyText(24);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: FxText.titleLarge("Terms \& Conditions",
                        fontWeight: 600),
                  ),
                ),
                Icon(MdiIcons.download)
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.titleMedium("1. Return policy",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodyMedium(
                text1,
                color: theme.colorScheme.onBackground,
                fontWeight: 500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: FxText.titleMedium(
                "2. Replace Policy",
                color: theme.colorScheme.primary,
                fontWeight: 600,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodyMedium(text2,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  height: 1.25,
                  letterSpacing: 0.1),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: FxText.titleMedium("3. Coupon policy",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodyMedium(text3,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  height: 1.25,
                  letterSpacing: 0.1),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: FxText.titleMedium("4. Other",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodyMedium(text4,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 500,
                  height: 1.25,
                  letterSpacing: 0.1),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 0),
                        child: FxText.bodyMedium(
                            "Buying this product, you agree to the all conditions",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500)),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("Decline", fontWeight: 600)),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("Accept",
                            fontWeight: 600, color: theme.colorScheme.primary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
