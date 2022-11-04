import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'checkout_screen.dart';
import 'product_review_screen.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key? key,
      this.heroTag = "heroTag",
      this.image = './assets/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  String descText = Generator.getDummyText(6);

  int selectedSize = 7;

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
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleMedium("Febreze AIR", fontWeight: 600),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          widget.image,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    FxSpacing.height(20),
                    FxText.bodyLarge("Febreze AIR",
                        fontWeight: 600, letterSpacing: 0.2),
                    FxSpacing.height(8),
                    FxText.bodySmall(descText,
                        fontWeight: 400, letterSpacing: 0),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: FxProgressBar(
                                width: 100,
                                height: 5,
                                activeColor: theme.colorScheme.primary,
                                inactiveColor: theme.colorScheme.onBackground
                                    .withAlpha(100),
                                progress: 0.6)),
                        FxSpacing.width(20),
                        FxText.bodySmall("123 Items",
                            fontWeight: 500, height: 1),
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FxContainer.bordered(
                            onTap: () {
                              _selectSizeSheet(context);
                            },
                            borderRadiusAll: 4,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.imageSizeSelectSmall,
                                  color: theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                FxSpacing.width(8),
                                FxText.bodyLarge(
                                  "Change",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                          FxSpacing.width(20),
                          FxContainer.bordered(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingProductReviewScreen()));
                            },
                            borderRadiusAll: 4,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.commentTextOutline,
                                  color: theme.colorScheme.onBackground,
                                  size: 24,
                                ),
                                FxSpacing.width(8),
                                FxText.titleSmall(
                                  "Review",
                                  fontWeight: 600,
                                  letterSpacing: -0.2,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FxContainer.bordered(
              paddingAll: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            FxText.bodyMedium(
                              "Color".toUpperCase(),
                              fontWeight: 600,
                              xMuted: true,
                            ),
                            FxSpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                                FxSpacing.width(4),
                                Icon(
                                  MdiIcons.chevronDown,
                                  size: 20,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            FxText.bodyMedium(
                              "QTY",
                              xMuted: true,
                              fontWeight: 600,
                            ),
                            FxSpacing.height(8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FxText.titleMedium("2", fontWeight: 600),
                                FxSpacing.width(4),
                                Icon(
                                  MdiIcons.chevronDown,
                                  size: 20,
                                  color: theme.colorScheme.onBackground
                                      .withAlpha(200),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  FxSpacing.height(24),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FxButton(
                          elevation: 2,
                          padding: FxSpacing.y(12),
                          borderRadiusAll: 4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                MdiIcons.cartPlus,
                                color: theme.colorScheme.onPrimary,
                                size: 20,
                              ),
                              FxSpacing.width(4),
                              FxText.bodyLarge(
                                "\$39.99",
                                letterSpacing: 0.4,
                                color: theme.colorScheme.onPrimary,
                                fontWeight: 600,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingCheckoutScreen()));
                          },
                        ),
                      ),
                      FxSpacing.width(20),
                      FxContainer(
                        padding: FxSpacing.xy(12, 12),
                        borderRadiusAll: 4,
                        color: theme.colorScheme.primary.withAlpha(40),
                        child: Icon(
                          MdiIcons.shoppingOutline,
                          size: 24,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return FxContainer(
                padding: FxSpacing.xy(32, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: FxText.bodyLarge("Select a Sizes",
                                    fontWeight: 700))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FxContainer.rounded(
                              paddingAll: 8,
                              color: customTheme.card,
                              child: Icon(
                                MdiIcons.close,
                                size: 20,
                                color: theme.colorScheme.onBackground,
                              )),
                        )
                      ],
                    ),
                    FxSpacing.height(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 4;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 4,
                            isSelected: selectedSize == 4,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 5,
                          isAvailable: false,
                          isSelected: selectedSize == 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 6;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 6,
                            isSelected: selectedSize == 6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 7;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 7,
                            isSelected: selectedSize == 7,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 8;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 8,
                            isSelected: selectedSize == 8,
                          ),
                        ),
                      ],
                    ),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SingleSizeWidget(
                          size: 9,
                          isAvailable: false,
                          isSelected: selectedSize == 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 11;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 11,
                            isSelected: selectedSize == 11,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 12;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 12,
                            isSelected: selectedSize == 12,
                          ),
                        ),
                        SingleSizeWidget(
                          size: 13,
                          isAvailable: false,
                          isSelected: selectedSize == 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = 14;
                            });
                          },
                          child: SingleSizeWidget(
                            size: 14,
                            isSelected: selectedSize == 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: theme.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.imageSizeSelectSmall,
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                    FxSpacing.height(8),
                                    FxText.bodyMedium("Size Guide",
                                        fontWeight: 600, letterSpacing: 0)
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.8,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: theme.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.emoticonSadOutline,
                                          color: theme.colorScheme.onPrimary,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: FxText.bodyMedium("Can't Find?",
                                            fontWeight: 600, letterSpacing: 0))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final int size;
  final bool isAvailable, isSelected;

  const SingleSizeWidget(
      {Key? key,
      required this.size,
      this.isAvailable = true,
      this.isSelected = false})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
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
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
            color: (widget.isAvailable && widget.isSelected)
                ? theme.colorScheme.primary
                : theme.colorScheme.background,
            width: 1.6),
        shape: BoxShape.circle,
        color: widget.isAvailable
            ? (widget.isSelected
                ? theme.colorScheme.primary
                : Colors.transparent)
            : customTheme.cardDark,
      ),
      child: Center(
        child: FxText.bodyLarge(widget.size.toString(),
            letterSpacing: -0.2,
            fontWeight: 600,
            color: (widget.isAvailable && widget.isSelected)
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onBackground),
      ),
    );
  }
}
