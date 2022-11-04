import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingAddCardScreen extends StatefulWidget {
  @override
  _ShoppingAddCardScreenState createState() => _ShoppingAddCardScreenState();
}

class _ShoppingAddCardScreenState extends State<ShoppingAddCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFront = true;

  //Credit card
  String creditCardNumber = "4040 4040 4040 4040";
  String creditCardDate = "MM/YY";
  String creditCardName = "Holder Name";
  String creditCardCVV = "739";
  Color creditCardColor = const Color(0xff334382);
  TextEditingController? cardNumberTextEditingController,
      cardDateTextEditingController,
      cardNameTextEditingController,
      cardCVVTextEditingController;

  //Focus node
  FocusNode? creditNumberFocusNode,
      creditDateFocusNode,
      creditNameFocusNode,
      creditCVVFocusNode;

  late ThemeData theme;

  flip({bool goFront = false, bool goBack = false}) async {
    if (goFront && isFront) {
      return;
    }
    if (goBack && !isFront) {
      return;
    }
    await _controller.reverse();
    setState(() {
      isFront = !isFront;
    });
    await _controller.forward();
  }

  initState() {
    super.initState();

    theme = AppTheme.theme;

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400), value: 1);

    cardNumberTextEditingController = TextEditingController();
    cardDateTextEditingController = TextEditingController();
    cardNameTextEditingController = TextEditingController();
    cardCVVTextEditingController = TextEditingController();

    creditNumberFocusNode = FocusNode();
    creditDateFocusNode = FocusNode();
    creditNameFocusNode = FocusNode();
    creditCVVFocusNode = FocusNode();

    cardNumberTextEditingController!.addListener(() {
      setState(() {
        if (cardNumberTextEditingController!.text.isNotEmpty)
          creditCardNumber = cardNumberTextEditingController!.text;
        else
          creditCardNumber = "4040 4040 4040 4040";
      });
    });

    cardDateTextEditingController!.addListener(() {
      setState(() {
        if (cardDateTextEditingController!.text.isNotEmpty)
          creditCardDate = cardDateTextEditingController!.text;
        else
          creditCardDate = "MM/YY";
      });
    });

    cardNameTextEditingController!.addListener(() {
      setState(() {
        if (cardNameTextEditingController!.text.isNotEmpty)
          creditCardName = cardNameTextEditingController!.text;
        else
          creditCardName = "Holder Name";
      });
    });

    cardCVVTextEditingController!.addListener(() {
      setState(() {
        if (cardCVVTextEditingController!.text.isNotEmpty)
          creditCardCVV = cardCVVTextEditingController!.text;
        else
          creditCardCVV = "739";
      });
    });

    creditNumberFocusNode!.addListener(() {
      flip(goFront: true);
    });
    creditDateFocusNode!.addListener(() {
      flip(goFront: true);
    });
    creditNameFocusNode!.addListener(() {
      flip(goFront: true);
    });

    creditCVVFocusNode!.addListener(() {
      flip(goBack: true);
    });
  }

  dispose() {
    super.dispose();
    cardNumberTextEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.titleMedium("Add Card", fontWeight: 600),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: FxSpacing.right(24), child: Icon(MdiIcons.check)))
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    transform:
                        Matrix4.rotationY((1 - _controller.value) * pi / 2),
                    alignment: Alignment.center,
                    child: Container(
                      height: 240,
                      child: isFront
                          ? Container(
                              height: 240,
                              margin: FxSpacing.xy(20, 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7,
                                    color: theme.colorScheme.surface),
                                color: creditCardColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: FxSpacing.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: FxSpacing.xy(8, 4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      child: FxText.titleMedium("VISA",
                                          fontWeight: 700,
                                          color: creditCardColor),
                                    ),
                                  ),
                                  FxText.titleMedium(creditCardNumber,
                                      fontWeight: 600,
                                      letterSpacing: 0.5,
                                      wordSpacing: 1,
                                      color: Colors.white),
                                  FxText.titleMedium(creditCardDate,
                                      fontWeight: 600,
                                      letterSpacing: 0.5,
                                      wordSpacing: 1,
                                      color: Colors.white),
                                  FxText.titleMedium(creditCardName,
                                      fontWeight: 500,
                                      letterSpacing: 0.3,
                                      wordSpacing: 1,
                                      color: Colors.white),
                                ],
                              ),
                            )
                          : Container(
                              height: 240,
                              margin: FxSpacing.xy(20, 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7,
                                    color: theme.colorScheme.surface),
                                color: creditCardColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Container(
                                padding: FxSpacing.y(24),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 36,
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            height: 36,
                                            color: Color(0xffbdc2d8),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 28,
                                          color: Colors.white,
                                          padding: FxSpacing.left(8),
                                          alignment: Alignment.centerLeft,
                                          child: FxText.titleMedium(
                                              creditCardCVV,
                                              color: Colors.black,
                                              fontWeight: 600,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: FxSpacing.right(24),
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: FxSpacing.xy(8, 4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4))),
                                        child: FxText.bodyLarge("VISA",
                                            fontWeight: 700,
                                            color: creditCardColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
              Expanded(
                child: ListView(
                  padding: FxSpacing.nBottom(24),
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Card Number",
                        hintText: "Card Number",
                        border: theme.inputDecorationTheme.border,
                        enabledBorder: theme.inputDecorationTheme.border,
                        focusedBorder: theme.inputDecorationTheme.focusedBorder,
                        prefixIcon: Icon(MdiIcons.numeric),
                      ),
                      controller: cardNumberTextEditingController,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: creditNumberFocusNode,
                      inputFormatters: [
                        //WhitelistingTextInputFormatter(RegExp(r"[\d]")),
                        LengthLimitingTextInputFormatter(19),
                        FxCardNumberInputFormatter()
                      ],
                    ),
                    FxSpacing.height(24),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Expired date",
                        hintText: "Expired date",
                        border: theme.inputDecorationTheme.border,
                        enabledBorder: theme.inputDecorationTheme.border,
                        focusedBorder: theme.inputDecorationTheme.focusedBorder,
                        prefixIcon: Icon(MdiIcons.calendarRangeOutline),
                      ),
                      controller: cardDateTextEditingController,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: creditDateFocusNode,
                      inputFormatters: [
                        FxCardMonthInputFormatter(),
                        LengthLimitingTextInputFormatter(5)
                      ],
                    ),
                    FxSpacing.height(24),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Card holder",
                        hintText: "Card holder",
                        border: theme.inputDecorationTheme.border,
                        enabledBorder: theme.inputDecorationTheme.border,
                        focusedBorder: theme.inputDecorationTheme.focusedBorder,
                        prefixIcon: Icon(MdiIcons.accountOutline),
                      ),
                      controller: cardNameTextEditingController,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: creditNameFocusNode,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(24),
                      ],
                    ),
                    FxSpacing.height(24),
                    InkWell(
                      onTap: () {
                        flip(goBack: true);
                      },
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "CVV",
                          hintText: "CVV",
                          border: theme.inputDecorationTheme.border,
                          enabledBorder: theme.inputDecorationTheme.border,
                          focusedBorder: FxAppTheme
                              .theme.inputDecorationTheme.focusedBorder,
                          prefixIcon: Icon(MdiIcons.creditCardOutline),
                        ),
                        focusNode: creditCVVFocusNode,
                        controller: cardCVVTextEditingController,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
