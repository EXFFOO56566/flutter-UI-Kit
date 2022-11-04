import 'package:flutkit/screens/news/news_full_app.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class NewsCategoryScreen extends StatefulWidget {
  @override
  _NewsCategoryScreenState createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> selectedChoices = [];

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: FxText.titleMedium(
                    "Select Category",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsFullApp()));
                  },
                  elevation: 2,
                  label: FxText.titleSmall("DONE",
                      fontWeight: 600,
                      color: theme.colorScheme.onPrimary,
                      letterSpacing: 0.3),
                  icon: Icon(
                    MdiIcons.arrowRight,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  padding: FxSpacing.all(24),
                  child: Wrap(
                    children: _buildChoiceList(),
                  ),
                )));
      },
    );
  }

  _buildChoiceList() {
    List<String> categoryList = [
      "ECom",
      "Automobile",
      "Crimes",
      "Business",
      "Fitness",
      "Astro",
      "Politics",
      "Relationship",
      "Food",
      "Electronics",
      "Health",
      "Tech",
      "Entertainment",
      "World",
      "Sports",
      "Other",
    ];

    List<Widget> choices = [];
    categoryList.forEach((item) {
      choices.add(Container(
        padding: FxSpacing.all(8),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: theme.colorScheme.primary,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              selectedChoices.contains(item)
                  ? Icon(
                      MdiIcons.check,
                      size: 16,
                      color: theme.colorScheme.onPrimary,
                    )
                  : Container(),
              selectedChoices.contains(item)
                  ? SizedBox(
                      width: 8,
                    )
                  : Container(),
              FxText.bodyMedium(item,
                  color: selectedChoices.contains(item)
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onBackground),
            ],
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }
}
