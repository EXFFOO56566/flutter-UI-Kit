import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/explore_controller.dart';
import '../models/movie.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ExploreController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ExploreController());
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(20));
    for (String category in controller.categories) {
      list.add(_buildSingleCategory(category));
    }
    list.add(FxSpacing.width(20));
    return list;
  }

  Widget _buildSingleMovie(Movie movie) {
    return FxContainer(
      onTap: () {
        controller.goToSingleMovieScreen(movie);
      },
      borderRadiusAll: 4,
      paddingAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(movie.image),
              height: 160,
              width: 200,
              fit: BoxFit.fill,
            ),
          ),
          FxSpacing.height(6),
          FxText.labelMedium(
            movie.name,
            fontWeight: 700,
          ),
          FxSpacing.height(2),
          FxText.labelMedium(
            movie.production,
          ),
          FxSpacing.height(4),
          FxContainer.bordered(
            border: Border.all(color: customTheme.muviPrimary),
            color: customTheme.muviPrimary.withAlpha(30),
            borderRadiusAll: 4,
            padding: FxSpacing.xy(8, 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FeatherIcons.star,
                  color: customTheme.muviPrimary,
                  size: 12,
                ),
                FxSpacing.width(6),
                FxText.bodySmall(
                  movie.ratings.toString(),
                  fontWeight: 600,
                  color: customTheme.muviPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCategory(String category) {
    bool selected = category == controller.selectedCategory;

    return FxContainer.bordered(
      onTap: () {
        controller.selectCategory(category);
      },
      borderRadiusAll: 24,
      border: Border.all(
          color: selected ? customTheme.muviPrimary : customTheme.border),
      margin: FxSpacing.right(8),
      padding: FxSpacing.xy(12, 6),
      color: selected ? customTheme.muviPrimary : customTheme.card,
      child: FxText.labelMedium(
        category,
        color: selected
            ? customTheme.muviOnPrimary
            : theme.colorScheme.onBackground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ExploreController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Container(
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding:
              FxSpacing.fromLTRB(0, FxSpacing.safeAreaTop(context) + 20, 0, 20),
          children: [
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: FxTextStyle.bodyMedium(),
                      cursorColor: customTheme.muviPrimary,
                      decoration: InputDecoration(
                        hintText: "Search your movie ...",
                        hintStyle: FxTextStyle.labelMedium(
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          FeatherIcons.search,
                          size: 16,
                          color: theme.colorScheme.onBackground.withAlpha(150),
                        ),
                        isDense: true,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  FxSpacing.width(20),
                  FxContainer(
                    paddingAll: 12,
                    borderRadiusAll: 4,
                    onTap: () {},
                    color: customTheme.muviPrimary,
                    child: Icon(
                      FeatherIcons.sliders,
                      color: customTheme.muviOnPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildCategoryList(),
              ),
            ),
            FxSpacing.height(20),
            GridView.builder(
                padding: FxSpacing.x(20),
                shrinkWrap: true,
                itemCount: controller.movies!.length,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: controller.findAspectRatio(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _buildSingleMovie(controller.movies![index]);
                }),
          ],
        ),
      );
    }
  }
}
