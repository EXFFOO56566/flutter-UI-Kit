import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'single_service_screen.dart';

class SelectServiceScreen extends StatefulWidget {
  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Container(
          margin: FxSpacing.fromLTRB(32, 48, 0, 0),
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Which ",
                  style: FxTextStyle.headlineSmall(
                      fontWeight: 500,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0)),
              TextSpan(
                  text: "service ",
                  style: FxTextStyle.headlineSmall(
                      fontWeight: 700,
                      color: customTheme.colorError,
                      letterSpacing: 0)),
              TextSpan(
                  text: "\ndo you",
                  style: FxTextStyle.headlineSmall(
                      fontWeight: 500,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0)),
              TextSpan(
                  text: "\nneed?",
                  style: FxTextStyle.headlineSmall(
                      fontWeight: 700,
                      color: theme.colorScheme.primary,
                      letterSpacing: 0)),
            ]),
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(32, 48, 32, 0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            childAspectRatio: 1.3,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            children: [
              singleService(
                  serviceIcon: MdiIcons.sprayBottle, service: "Cleaning"),
              singleService(serviceIcon: MdiIcons.brush, service: "Paint"),
              singleService(serviceIcon: MdiIcons.carWash, service: "Car Wash"),
              singleService(serviceIcon: MdiIcons.chefHat, service: "Cooking"),
              singleService(
                  serviceIcon: MdiIcons.cameraOutline, service: "Camera Man"),
              singleService(
                  serviceIcon: MdiIcons.waterOutline, service: "Water"),
              singleService(
                  serviceIcon: MdiIcons.tableFurniture, service: "Furniture"),
              singleService(
                  serviceIcon: MdiIcons.carBrakeRetarder, service: "Other"),
            ],
          ),
        )
      ],
    ));
  }

  Widget singleService({IconData? serviceIcon, required String service}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleServiceScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.primary, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: theme.colorScheme.primary.withAlpha(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              serviceIcon,
              color: theme.colorScheme.primary,
            ),
            Container(
              margin: FxSpacing.top(8),
              child: FxText.titleSmall(service,
                  color: theme.colorScheme.primary,
                  fontWeight: 500,
                  letterSpacing: 0),
            )
          ],
        ),
      ),
    );
  }
}
