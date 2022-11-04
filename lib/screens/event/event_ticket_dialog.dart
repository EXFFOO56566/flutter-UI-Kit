import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class EventTicketDialog extends StatefulWidget {
  @override
  _EventTicketDialogState createState() => _EventTicketDialogState();
}

class _EventTicketDialogState extends State<EventTicketDialog> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedCategory = 0;

  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image(
                  image: AssetImage('./assets/images/apps/event/pattern-1.png'),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 16, 16, 0),
              child: FxText.bodyLarge("Flutter Event - 1",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodySmall("Date",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        FxText.bodyMedium("Fri, April 12, 2020",
                            color: theme.colorScheme.onBackground)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodySmall("Time",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        FxText.bodyMedium("8:15 AM",
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall("Place",
                      xMuted: true, color: theme.colorScheme.onBackground),
                  FxText.bodyLarge("Parker Drive\n35, County Line Road",
                      color: theme.colorScheme.onBackground, fontWeight: 500)
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(24),
              child: FxDashedDivider(
                height: 1,
                color: theme.colorScheme.onBackground.withAlpha(60),
                dashWidth: 7,
              ),
            ),
            Container(
              margin: FxSpacing.vertical(32),
              child: Center(
                  child: Image(
                image: AssetImage('./assets/other/barcode.png'),
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fill,
              )),
            )
          ],
        ));
  }
}
