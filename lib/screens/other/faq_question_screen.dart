import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class FAQQuestionScreen extends StatefulWidget {
  @override
  _FAQQuestionScreenState createState() => _FAQQuestionScreenState();
}

class _FAQQuestionScreenState extends State<FAQQuestionScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  List<bool> _dataExpansionPanel = [false, true, false, false, false];

  late List<String> _content;

  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _content = List.generate(
        5,
        (index) => Generator.getParagraphsText(
            paragraph: 2, words: 24, noOfNewLine: 2, withHyphen: true));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("FAQ", fontWeight: 600),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(bottom: 20),
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
                        return ListTile(
                          title: FxText.titleSmall("What is offers",
                              color: isExpanded
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onBackground,
                              fontWeight: isExpanded ? 600 : 500),
                        );
                      },
                      body: Container(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                              FxText.bodyMedium(_content[0], fontWeight: 500),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[0]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: FxText.titleSmall(
                              "How do i make payment with credit card",
                              color: isExpanded
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onBackground,
                              fontWeight: isExpanded ? 600 : 500),
                        );
                      },
                      body: Container(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                              FxText.bodyMedium(_content[1], fontWeight: 500),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[1]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: FxText.titleSmall(
                              "How can i upgrade my membership",
                              color: isExpanded
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onBackground,
                              fontWeight: isExpanded ? 600 : 500),
                        );
                      },
                      body: Container(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                              FxText.bodyMedium(_content[2], fontWeight: 500),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[2]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: FxText.titleSmall("How i contact with seller",
                              color: isExpanded
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onBackground,
                              fontWeight: isExpanded ? 600 : 500),
                        );
                      },
                      body: Container(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                              FxText.titleSmall(_content[3], fontWeight: 500),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[3]),
                  ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: FxText.bodyLarge("Where is my order",
                              color: isExpanded
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onBackground,
                              fontWeight: isExpanded ? 600 : 500),
                        );
                      },
                      body: Container(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: Center(
                          child:
                              FxText.bodyMedium(_content[4], fontWeight: 500),
                        ),
                      ),
                      isExpanded: _dataExpansionPanel[4]),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: FxText.bodyLarge("Visit our site",
                      color: theme.colorScheme.primary, fontWeight: 600),
                ),
              )
            ],
          ),
        ));
  }
}
