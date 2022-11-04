/*
* File : Invoice Expansion
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class InvoiceExpansion extends StatefulWidget {
  @override
  _InvoiceExpansionState createState() => _InvoiceExpansionState();
}

class _InvoiceExpansionState extends State<InvoiceExpansion> {
  List<bool> _dataExpansionPanel = [true, false, true];

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
        body: ListView(
      children: <Widget>[
        Container(
          padding: FxSpacing.xy(24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleSmall("Invoice", fontWeight: 600),
                  FxText.bodyLarge("# 100457", fontWeight: 500),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FxText.titleSmall("Date", fontWeight: 600),
                  FxText.bodyLarge("8, Jun", fontWeight: 500),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: theme.backgroundColor,
          padding: FxSpacing.all(16),
          child: Column(
            children: <Widget>[
              ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _dataExpansionPanel[index] = !isExpanded;
                  });
                },
                animationDuration: Duration(milliseconds: 500),
                children: <ExpansionPanel>[
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: FxSpacing.all(16),
                            child: FxText.titleMedium("Personal Information",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: FxSpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.titleSmall("Mr. Rodrigo Pierce",
                                  height: 1.4, fontWeight: 500),
                              FxText.titleSmall("rog_pie@gmail.com",
                                  height: 1.4,
                                  fontWeight: 500,
                                  letterSpacing: 0.3),
                              FxText.titleSmall("Contact : (047) 98760235 ",
                                  fontWeight: 500, height: 1.4),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[0]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: FxSpacing.all(16),
                            child: FxText.titleMedium("Address",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: FxSpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.titleSmall("4675  Hartland Avenue",
                                  fontWeight: 500, height: 1.4),
                              FxText.titleSmall("Ashwa - 54304",
                                  fontWeight: 500, height: 1.4),
                              FxText.titleSmall("United Kingdom ",
                                  fontWeight: 500, height: 1.4),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[1]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            padding: FxSpacing.all(16),
                            child: FxText.titleMedium("Bill",
                                fontWeight: isExpanded ? 700 : 600,
                                letterSpacing: 0));
                      },
                      body: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: FxSpacing.fromLTRB(24, 0, 24, 16),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FxText.titleMedium("Subtotal",
                                      fontWeight: 600, height: 1.4),
                                  FxText.titleMedium("\$  299.99",
                                      fontWeight: 600, height: 1.4),
                                ],
                              ),
                              Padding(
                                padding: FxSpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FxText.titleMedium("Shipping cost",
                                        fontWeight: 600, height: 1.4),
                                    FxText.titleMedium("\$  49",
                                        fontWeight: 600, height: 1.4),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: FxSpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FxText.titleMedium("Taxes",
                                        fontWeight: 600, height: 1.4),
                                    FxText.titleMedium("\$  29",
                                        fontWeight: 600, height: 1.4),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: FxSpacing.top(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FxText.titleMedium("Total",
                                        height: 1.4, fontWeight: 800),
                                    FxText.titleMedium("\$  399",
                                        height: 1.4, fontWeight: 800),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      isExpanded: _dataExpansionPanel[2])
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
