/*
* File : Accept Policy Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PolicyDialog extends StatefulWidget {
  @override
  _PolicyDialogState createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _TermsDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FxButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _showDialog();
          },
          child: FxText.bodyMedium("Accept Terms",
              color: theme.colorScheme.onPrimary)),
    ));
  }
}

class _TermsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(20),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
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
                    child: FxText.titleLarge("Terms", fontWeight: 600),
                  ),
                ),
                Icon(Icons.download)
              ],
            ),
            Divider(),
            Container(
              margin: FxSpacing.only(top: 8),
              child: RichText(
                text: TextSpan(
                    style: FxTextStyle.titleSmall(
                        fontWeight: 600, letterSpacing: 0.2),
                    children: <TextSpan>[
                      TextSpan(
                        text: "By Creating an account you agree to the xyz ",
                      ),
                      TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary)),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary)),
                    ]),
              ),
            ),
            Container(
                margin: FxSpacing.top(24),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium(
                          "Decline",
                          fontWeight: 600,
                          color: theme.colorScheme.primary,
                        )),
                    FxButton(
                        backgroundColor: theme.colorScheme.primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("Accept",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
