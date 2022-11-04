import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductsSearchScreen extends StatefulWidget {
  @override
  _ProductsSearchScreenState createState() => _ProductsSearchScreenState();
}

class _ProductsSearchScreenState extends State<ProductsSearchScreen> {
  bool _isInProgress = false;
  Timer? _timer;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const Duration oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        FxSpacing.height(48),
        FxContainer(
          margin: FxSpacing.x(16),
          padding: FxSpacing.xy(12, 4),
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    size: 24,
                    color: theme.colorScheme.onBackground,
                  )),
              FxSpacing.width(16),
              Expanded(
                child: FxTextField(
                  hintText: "Try to Search",
                  hintStyle: FxTextStyle.bodyMedium(),
                  labelStyle: FxTextStyle.bodyMedium(),
                  style: FxTextStyle.bodyMedium(),
                  autoIcon: false,
                  autofocus: false,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: _onSubmit,
                ),
              ),
            ],
          ),
        ),
        FxSpacing.height(16),
        Expanded(
          child: _isInProgress
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    )),
                  ),
                )
              : ListView(
                  padding: FxSpacing.zero,
                  children: <Widget>[
                    Container(
                      padding: FxSpacing.x(16),
                      child: FxText.bodyMedium("Result", fontWeight: 600),
                    ),
                    Container(
                      padding: FxSpacing.nBottom(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-7.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 4,
                            countStar: 15,
                          )),
                          FxSpacing.width(16),
                          Expanded(
                              child: _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-8.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: FxSpacing.nBottom(16),
                      child: FxText.bodyMedium("Recommended", fontWeight: 600),
                    ),
                    FxSpacing.height(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          FxSpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-3.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 4,
                            countStar: 15,
                            width: 160,
                          ),
                          FxSpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-5.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                            width: 160,
                          ),
                          FxSpacing.width(16),
                          _SimpleCard(
                            image:
                                './assets/images/apps/shopping/product/product-2.jpg',
                            name: 'Product-1',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes',
                            star: 5,
                            countStar: 2,
                            width: 160,
                          ),
                          FxSpacing.width(16),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ],
    ));
  }
}

class _SimpleCard extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const _SimpleCard({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return FxContainer(
      paddingAll: 0,
      clipBehavior: Clip.hardEdge,
      width: widget.width == null
          ? MediaQuery.of(context).size.width
          : widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(widget.image!),
            width: widget.width == null
                ? MediaQuery.of(context).size.width
                : widget.width,
            fit: BoxFit.fill,
          ),
          FxContainer(
            paddingAll: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.bodyMedium(widget.name!),
                FxSpacing.height(2),
                FxText.bodySmall(
                  widget.description!,
                  letterSpacing: 0.15,
                  height: 1.2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                FxSpacing.height(2),
                Row(
                  children: <Widget>[
                    FxStarRating(
                        rating: widget.star!.toDouble(),
                        inactiveColor: Generator.starColor),
                    FxSpacing.width(4),
                    FxText.bodyMedium("(" + widget.countStar.toString() + ")",
                        letterSpacing: 0.2)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
