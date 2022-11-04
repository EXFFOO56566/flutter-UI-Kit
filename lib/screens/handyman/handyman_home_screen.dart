import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'select_service_screen.dart';
import 'worker_information_screen.dart';

class HandymanHomeScreen extends StatefulWidget {
  @override
  _HandymanHomeScreenState createState() => _HandymanHomeScreenState();
}

class _HandymanHomeScreenState extends State<HandymanHomeScreen> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.primary,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectServiceScreen()));
          },
          child: Icon(
            MdiIcons.plus,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: ListView(
          padding: FxSpacing.top(48),
          children: [
            Container(
              margin: FxSpacing.fromLTRB(24, 0, 24, 0),
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_1.jpg'),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 0, 0),
              child: FxText.titleMedium("Hello",
                  xMuted: true, color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: FxSpacing.left(24),
              child: FxText.headlineMedium("Denish",
                  letterSpacing: -0.5,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 700),
            ),
            Container(
              margin: FxSpacing.fromLTRB(24, 16, 24, 0),
              child: Column(
                children: [
                  singleWorker(
                      image: './assets/images/profile/avatar.jpg',
                      name: "Dolcie Pineda",
                      profession: "Plumber",
                      perHour: 9.5,
                      rate: 4.5,
                      status: "Pending",
                      statusColor: customTheme.disabledColor),
                  singleWorker(
                      image: './assets/images/profile/avatar_1.jpg',
                      name: "Dainton Mccoy",
                      profession: "Home Painter",
                      perHour: 15,
                      rate: 5,
                      status: "Approved",
                      statusColor: theme.colorScheme.primary),
                  singleWorker(
                      image: './assets/images/profile/avatar_2.jpg',
                      name: "Sid Moore",
                      profession: "Cleaner",
                      perHour: 8,
                      rate: 4,
                      status: "Rejected",
                      statusColor: customTheme.colorError),
                  singleWorker(
                      image: './assets/images/profile/avatar_3.jpg',
                      name: "Eliana Rees",
                      profession: "Cook",
                      perHour: 10,
                      rate: 4.2,
                      status: "In Process",
                      statusColor: customTheme.colorInfo),
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate,
      required String status,
      Color? statusColor}) {
    return Container(
      margin: FxSpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.borderDark, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: FxSpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkerInformationScreen()));
        },
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage(image),
                  width: 72,
                  height: 72,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.bodyMedium(
                          name,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                        ),
                        FxText.bodyMedium(status,
                            color: statusColor, fontWeight: 600)
                      ],
                    ),
                    FxText.bodySmall(profession,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true),
                    Container(
                      margin: FxSpacing.top(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                MdiIcons.star,
                                color: Generator.starColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              FxText.bodyMedium(rate.toString(),
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 600)
                            ],
                          ),
                          FxText.bodyMedium(
                              "\$" + perHour.toString() + " per Hour",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
