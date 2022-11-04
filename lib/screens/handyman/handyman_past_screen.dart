import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'handyman_rating_screen.dart';

class HandymanPastScreen extends StatefulWidget {
  @override
  _HandymanPastScreenState createState() => _HandymanPastScreenState();
}

class _HandymanPastScreenState extends State<HandymanPastScreen> {
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
          title: FxText.titleLarge("Past Work",
              color: theme.colorScheme.onBackground, fontWeight: 600),
          centerTitle: true,
        ),
        body: ListView(
          padding: FxSpacing.zero,
          children: [
            Container(
              margin: FxSpacing.fromLTRB(24, 8, 24, 0),
              child: Column(
                children: [
                  pastWork(
                      image: './assets/images/profile/avatar_4.jpg',
                      name: "Sid Moore",
                      profession: "Plumber",
                      bill: 19,
                      rate: 4.5,
                      isRated: true),
                  pastWork(
                    image: './assets/images/profile/avatar_5.jpg',
                    name: "Dainton Mccoy",
                    profession: "Home Painter",
                    bill: 15,
                    rate: 5,
                    isRated: true,
                  ),
                  pastWork(
                    image: './assets/images/profile/avatar.jpg',
                    name: "Dolcie Pineda",
                    profession: "Cleaner",
                    bill: 8,
                    rate: 4,
                    isRated: false,
                  ),
                  pastWork(
                    image: './assets/images/profile/avatar_5.jpg',
                    name: "Eliana Rees",
                    profession: "Cook",
                    bill: 27,
                    rate: 4.2,
                    isRated: false,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget pastWork(
      {required String image,
      required String name,
      required String profession,
      double? bill,
      double? rate,
      required bool isRated}) {
    return Container(
      margin: FxSpacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: FxSpacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HandymanRatingScreen()));
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
                        isRated
                            ? FxText.bodyMedium("Rated",
                                color: customTheme.disabledColor,
                                fontWeight: 600)
                            : FxText.bodyMedium("Rate",
                                color: theme.colorScheme.primary,
                                fontWeight: 600)
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
                          FxText.bodyMedium("Payed \$" + bill.toString(),
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
