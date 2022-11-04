import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'book_service_screen.dart';

class SingleServiceScreen extends StatefulWidget {
  @override
  _SingleServiceScreenState createState() => _SingleServiceScreenState();
}

class _SingleServiceScreenState extends State<SingleServiceScreen> {
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
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleLarge("Cleaning",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 16, 24, 0),
          children: [
            singleWorker(
                image: './assets/images/profile/avatar.jpg',
                name: "Dolcie Pineda",
                profession: "Plumber",
                perHour: 9.5,
                rate: 4.5),
            singleWorker(
                image: './assets/images/profile/avatar_1.jpg',
                name: "Dainton Mccoy",
                profession: "Home Painter",
                perHour: 15,
                rate: 5),
            singleWorker(
                image: './assets/images/profile/avatar_2.jpg',
                name: "Sid Moore",
                profession: "Cleaner",
                perHour: 8,
                rate: 4),
            singleWorker(
                image: './assets/images/profile/avatar_3.jpg',
                name: "Eliana Rees",
                profession: "Cook",
                perHour: 10,
                rate: 4.2),
            singleWorker(
                image: './assets/images/profile/avatar_4.jpg',
                name: "Giles Nunez",
                profession: "Carpenter",
                perHour: 11,
                rate: 4.8),
            Container(
              alignment: Alignment.center,
              child: FxText.bodyLarge("More", color: theme.colorScheme.primary),
            )
          ],
        ));
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate}) {
    return Container(
      margin: FxSpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: FxSpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookServiceScreen()));
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
                    FxText.bodyMedium(
                      name,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600,
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
