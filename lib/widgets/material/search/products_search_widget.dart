/*
* File : Product Search
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductsSearchWidget extends StatefulWidget {
  @override
  _ProductsSearchWidgetState createState() => _ProductsSearchWidgetState();
}

class _ProductsSearchWidgetState extends State<ProductsSearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;

  void _onSubmit(text) {
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
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
    // TODO: implement dispose
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        FxSpacing.height(FxSpacing.safeAreaTop(context) + 20),
        FxContainer(
          padding:
              const EdgeInsets.only(left: 12.0, top: 8, right: 12, bottom: 8),
          margin: FxSpacing.nTop(20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    size: 24,
                    color: theme.colorScheme.onBackground.withAlpha(240),
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 8),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Try to search",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        isDense: true,
                      ),
                      autofocus: false,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: _onSubmit,
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: theme.colorScheme.secondary,
                child: FxText.titleSmall("A",
                    color: theme.colorScheme.onSecondary),
              )
            ],
          ),
        ),
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
              : Container(
                  color: theme.backgroundColor,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: FxText.bodyMedium("RESULT", fontWeight: 600),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 8),
                              child: _SimpleCard(
                                image:
                                    './assets/images/apps/shopping/product/product-7.jpg',
                                name: 'Product-1',
                                description:
                                    'Lorem ipsum, or lipsum as it is sometimes',
                                star: 4,
                                countStar: 15,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(left: 8),
                              child: _SimpleCard(
                                image:
                                    './assets/images/apps/shopping/product/product-8.jpg',
                                name: 'Product-1',
                                description:
                                    'Lorem ipsum, or lipsum as it is sometimes',
                                star: 5,
                                countStar: 2,
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 4),
                        child:
                            FxText.bodyMedium("RECOMMENDED", fontWeight: 600),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20, bottom: 8),
                                child: _SimpleCard(
                                  image:
                                      './assets/images/apps/shopping/product/product-3.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 4,
                                  countStar: 15,
                                  width: 200,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, bottom: 8),
                                child: _SimpleCard(
                                  image:
                                      './assets/images/apps/shopping/product/product-5.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 5,
                                  countStar: 2,
                                  width: 200,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 8),
                                child: _SimpleCard(
                                  image:
                                      './assets/images/apps/shopping/product/product-2.jpg',
                                  name: 'Product-1',
                                  description:
                                      'Lorem ipsum, or lipsum as it is sometimes',
                                  star: 5,
                                  countStar: 2,
                                  width: 200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
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
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return FxContainer.none(
      width: widget.width ?? MediaQuery.of(context).size.width,
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
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(widget.name!, fontWeight: 600),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: FxText.bodySmall(
                        widget.description.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Row(
                        children: <Widget>[
                          FxStarRating(
                              rating: widget.star!.toDouble(),
                              inactiveColor: Generator.starColor),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: FxText(
                              "(" + widget.countStar.toString() + ")",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
