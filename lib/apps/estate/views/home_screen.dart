import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/home_controller.dart';
import '../models/category.dart';
import '../models/house.dart';
import 'single_estate_screen.dart';

class EstateHomeScreen extends StatefulWidget {
  const EstateHomeScreen({Key? key}) : super(key: key);

  @override
  _EstateHomeScreenState createState() => _EstateHomeScreenState();
}

class _EstateHomeScreenState extends State<EstateHomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateHomeController estateHomeController;

  @override
  void initState() {
    super.initState();
    estateHomeController = FxControllerStore.putOrFind(EstateHomeController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (Category category in estateHomeController.categories!) {
      list.add(_buildSingleCategory(category));
    }
    return list;
  }

  List<Widget> _buildFilterCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (Category category in estateHomeController.categories!) {
      list.add(_buildFilterCategory(category));
    }
    return list;
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in estateHomeController.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Container(
      margin: FxSpacing.right(16),
      child: Column(
        children: [
          FxContainer.rounded(
            color: customTheme.card.withAlpha(180),
            child: Icon(
              category.categoryIcon,
              color: customTheme.estatePrimary,
            ),
          ),
          FxSpacing.height(8),
          FxText.labelSmall(
            category.category,
            xMuted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(Category category) {
    return FxContainer(
      paddingAll: 8,
      borderRadiusAll: 8,
      margin: FxSpacing.right(8),
      bordered: true,
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: customTheme.card,
      child: Row(
        children: [
          Icon(
            category.categoryIcon,
            color: customTheme.estatePrimary,
            size: 16,
          ),
          FxSpacing.width(8),
          FxText.bodySmall(
            category.category,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleHouse(House house) {
    return FxCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: FxSpacing.nTop(24),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 16,
      child: Column(
        children: [
          Image(
            image: AssetImage(house.image),
            fit: BoxFit.fitWidth,
          ),
          FxContainer(
            paddingAll: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium(
                      house.name,
                      fontWeight: 700,
                    ),
                    FxText.bodyMedium(
                      house.price,
                      fontWeight: 600,
                      color: customTheme.estateSecondary,
                    ),
                  ],
                ),
                FxSpacing.height(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: theme.colorScheme.onBackground.withAlpha(180),
                    ),
                    FxSpacing.width(4),
                    FxText.bodySmall(
                      house.location,
                      xMuted: true,
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.king_bed,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.bodySmall(
                            house.bedrooms,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.bathtub,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.bodySmall(
                            house.bathrooms,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.square_foot,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.bodySmall(
                            house.floors,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.aspect_ratio,
                            size: 16,
                            color:
                                theme.colorScheme.onBackground.withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.bodySmall(
                            house.area,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateHomeController>(
        controller: estateHomeController,
        builder: (estateHomeController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 2,
                    child: estateHomeController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
                            minHeight: 2,
                          )
                        : Container(
                            height: 2,
                          ),
                  ),
                  Expanded(
                    child: _buildBody(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateHomeController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: FxSpacing.top(16),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodySmall(
                      'Location',
                      xMuted: true,
                    ),
                    FxSpacing.height(2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: customTheme.estatePrimary,
                          size: 14,
                        ),
                        FxSpacing.width(4),
                        FxText.bodyMedium(
                          'San Jose, CA',
                          fontWeight: 600,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: customTheme.estatePrimary,
                        ),
                      ],
                    ),
                  ],
                ),
                FxContainer.bordered(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  paddingAll: 6,
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyLarge(
                  'Recommended',
                  fontWeight: 600,
                ),
                FxText.bodySmall(
                  'More',
                  xMuted: true,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          Column(
            children: _buildHouseList(),
          ),
        ],
      );
    }
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return FxContainer(
                padding: FxSpacing.top(24),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxCard.rounded(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            paddingAll: 6,
                            color: customTheme.border,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                          FxText.bodyMedium(
                            'Filters',
                            fontWeight: 600,
                          ),
                          FxText.bodySmall(
                            'Reset',
                            color: customTheme.estatePrimary,
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.height(8),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.bodyMedium(
                        'Category',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _buildFilterCategoryList(),
                      ),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.bodyMedium(
                        'Price Range ( ' +
                            '${estateHomeController.selectedRange.start.toInt().toString()} - ' +
                            '${estateHomeController.selectedRange.end.toInt().toString()} )',
                        fontWeight: 700,
                      ),
                    ),
                    RangeSlider(
                        activeColor: customTheme.estatePrimary,
                        inactiveColor: customTheme.estatePrimary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: estateHomeController.selectedRange,
                        onChanged: (RangeValues newRange) {
                          setState(() =>
                              estateHomeController.selectedRange = newRange);
                        }),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.bodyMedium(
                        'Bed Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (estateHomeController.selectedBedRooms
                                    .contains(element)) {
                                  estateHomeController.selectedBedRooms
                                      .remove(element);
                                } else {
                                  estateHomeController.selectedBedRooms
                                      .add(element);
                                }
                              });
                            },
                            child: SingleBed(
                              bed: element,
                              selected: estateHomeController.selectedBedRooms
                                  .contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.bodyMedium(
                        'Bath Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (estateHomeController.selectedBathRooms
                                    .contains(element)) {
                                  estateHomeController.selectedBathRooms
                                      .remove(element);
                                } else {
                                  estateHomeController.selectedBathRooms
                                      .add(element);
                                }
                              });
                            },
                            child: SingleBath(
                              bath: element,
                              selected: estateHomeController.selectedBathRooms
                                  .contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxButton.block(
                        borderRadiusAll: 8,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: customTheme.estatePrimary,
                        child: FxText.titleSmall(
                          "Apply Filters",
                          fontWeight: 700,
                          color: customTheme.estateOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleBed extends StatefulWidget {
  final String bed;
  final bool selected;

  const SingleBed({Key? key, required this.bed, required this.selected})
      : super(key: key);

  @override
  _SingleBedState createState() => _SingleBedState();
}

class _SingleBedState extends State<SingleBed> {
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
    bool selected = widget.selected;

    return FxContainer(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(
          color: selected ? customTheme.estatePrimary : customTheme.border),
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: selected ? customTheme.estatePrimary : customTheme.border,
      child: FxText.bodySmall(
        widget.bed,
        fontWeight: 600,
        color: selected
            ? customTheme.estateOnPrimary
            : theme.colorScheme.onBackground,
      ),
    );
  }
}

class SingleBath extends StatefulWidget {
  final String bath;
  final bool selected;

  const SingleBath({Key? key, required this.bath, required this.selected})
      : super(key: key);

  @override
  _SingleBathState createState() => _SingleBathState();
}

class _SingleBathState extends State<SingleBath> {
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
    bool selected = widget.selected;

    return FxContainer(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(
          color: selected ? customTheme.estatePrimary : customTheme.border),
      splashColor: customTheme.medicarePrimary.withAlpha(40),
      color: selected ? customTheme.estatePrimary : customTheme.border,
      child: FxText.bodySmall(
        widget.bath,
        fontWeight: 600,
        color: selected
            ? customTheme.estateOnPrimary
            : theme.colorScheme.onBackground,
      ),
    );
  }
}
