import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingProductReviewScreen extends StatefulWidget {
  @override
  _ShoppingProductReviewScreenState createState() =>
      _ShoppingProductReviewScreenState();
}

class _ShoppingProductReviewScreenState
    extends State<ShoppingProductReviewScreen> {
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
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleMedium("Reviews", fontWeight: 600),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    FxText.headlineMedium("4.0",
                        letterSpacing: 0.5, fontWeight: 700),
                    FxSpacing.height(8),
                    FxStarRating(
                        rating: 4.0,
                        inactiveColor: customTheme.border,
                        size: 24,
                        spacing: 1,
                        inactiveStarFilled: true),
                    FxSpacing.height(4),
                    FxText.bodySmall(
                      "Based on 23 reviews",
                      letterSpacing: 0,
                      muted: true,
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodySmall(
                          "Excellent",
                          muted: true,
                        ),
                        FxProgressBar(
                            progress: 85,
                            activeColor: Colors.green,
                            inactiveColor: customTheme.border,
                            width: MediaQuery.of(context).size.width - 150,
                            height: 4),
                      ],
                    ),
                    FxSpacing.height(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodySmall(
                          "Good",
                          muted: true,
                        ),
                        FxProgressBar(
                            progress: 65,
                            activeColor: Colors.green,
                            inactiveColor: customTheme.border,
                            width: MediaQuery.of(context).size.width - 150,
                            height: 4),
                      ],
                    ),
                    FxSpacing.height(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodySmall(
                          "Average",
                          muted: true,
                        ),
                        FxProgressBar(
                            progress: 45,
                            activeColor: Colors.yellow,
                            inactiveColor: customTheme.border,
                            width: MediaQuery.of(context).size.width - 150,
                            height: 4),
                      ],
                    ),
                    FxSpacing.height(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodySmall(
                          "Below Average",
                          muted: true,
                        ),
                        FxProgressBar(
                            progress: 12,
                            activeColor: Colors.orange,
                            inactiveColor: customTheme.border,
                            width: MediaQuery.of(context).size.width - 150,
                            height: 4),
                      ],
                    ),
                    FxSpacing.height(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FxText.bodySmall(
                          "Poor",
                          muted: true,
                        ),
                        FxProgressBar(
                            progress: 25,
                            activeColor: Colors.red,
                            inactiveColor: customTheme.border,
                            width: MediaQuery.of(context).size.width - 150,
                            height: 4),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(32),
              Container(
                margin: FxSpacing.x(24),
                child: Column(
                  children: <Widget>[
                    _singleReview(
                        image: "./assets/images/profile/avatar_4.jpg",
                        name: "Tegan Payne",
                        rating: 5,
                        review: FxTextUtils.getDummyText(32),
                        time: "1 day ago"),
                    FxSpacing.height(24),
                    _singleReview(
                        image: "./assets/images/profile/avatar_3.jpg",
                        name: "Jamal Rossi",
                        rating: 4,
                        review: FxTextUtils.getDummyText(25),
                        time: "7 days ago"),
                    FxSpacing.height(24),
                    _singleReview(
                        image: "./assets/images/profile/avatar_2.jpg",
                        name: "Harvie Duncan",
                        rating: 4,
                        review: FxTextUtils.getDummyText(30),
                        time: "1 month ago"),
                  ],
                ),
              ),
              FxSpacing.height(24),
              Center(
                child: FxButton.text(
                  onPressed: () {},
                  splashColor: theme.colorScheme.primary.withAlpha(40),
                  child: FxText.bodyMedium(
                    "Write a Review",
                    color: theme.colorScheme.primary,
                    fontWeight: 600,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _singleReview(
      {required String image,
      required String name,
      required double rating,
      required String time,
      required String review}) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FxContainer.rounded(
                  width: 36,
                  paddingAll: 0,
                  height: 36,
                  child: Image(image: AssetImage(image), fit: BoxFit.fill)),
              FxSpacing.width(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(name, fontWeight: 600),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FxStarRating(
                            rating: rating, showInactive: false, spacing: 0),
                        FxSpacing.width(4),
                        FxText.bodyMedium(rating.toString(), fontWeight: 600)
                      ],
                    )
                  ],
                ),
              ),
              FxText.bodySmall(
                time,
                muted: true,
                fontWeight: 600,
              )
            ],
          ),
          FxSpacing.height(12),
          FxText.bodySmall("- " + review),
        ],
      ),
    );
  }
}
