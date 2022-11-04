import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/home_controller.dart';
import '../models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(HomeController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleMovie(Movie movie) {
    return FxContainer(
      onTap: () {
        controller.goToSingleMovieScreen(movie);
      },
      borderRadiusAll: 4,
      paddingAll: 0,
      // margin: FxSpacing.right(20),
      color: theme.scaffoldBackgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            borderRadiusAll: 4,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              height: 150,
              width: 120,
              fit: BoxFit.fill,
              image: AssetImage(movie.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.bodyMedium(
            movie.name,
            fontWeight: 600,
          ),
          FxSpacing.height(4),
          FxText.bodySmall(
            movie.production,
            xMuted: true,
          ),
          FxSpacing.height(4),
          FxStarRating(
            size: 18,
            spacing: 4,
            activeColor: customTheme.muviPrimary,
            inactiveColor: customTheme.muviPrimary.withAlpha(100),
            inactiveStarFilled: true,
            showInactive: true,
            rating: movie.ratings,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTrendingList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(20));
    for (int i = 0; i < 5; i++) {
      list.add(_buildSingleMovie(controller.movies![i]));
      list.add(FxSpacing.width(20));
    }
    return list;
  }

  List<Widget> _buildHollyWoodList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(20));
    for (int i = 0; i < controller.movies!.length - 5; i++) {
      list.add(_buildSingleMovie(controller.movies![i + 5]));
      list.add(FxSpacing.width(20));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
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
              )));
    } else {
      return Scaffold(
        body: ListView(
          padding:
              FxSpacing.fromLTRB(0, FxSpacing.safeAreaTop(context) + 20, 0, 20),
          children: [
            FxContainer(
              onTap: () {
                controller.goToSubscriptionScreen();
              },
              paddingAll: 0,
              margin: FxSpacing.x(20),
              borderRadiusAll: 4,
              height: 210,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Image(
                    height: 210,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/apps/muvi/banner.jpg'),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FxText.bodyMedium(
                                'Avengers : Endgame',
                                color: customTheme.muviOnPrimary,
                                letterSpacing: 0.3,
                                fontWeight: 600,
                              ),
                              FxSpacing.height(8),
                              FxText.bodySmall(
                                'Marvel Studio',
                                color: customTheme.muviOnPrimary,
                                letterSpacing: 0.3,
                              ),
                            ],
                          ),
                        ),
                        FxContainer.none(
                            padding: FxSpacing.fromLTRB(12, 6, 12, 6),
                            color: customTheme.muviPrimary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            child: FxText.labelMedium(
                              'Premium',
                              color: customTheme.muviOnPrimary,
                              letterSpacing: 0.3,
                            ))
                      ],
                    ),
                  ),
                  // Positioned(
                  //   right: 20,
                  //   bottom: -20,
                  //   child: FxContainer.rounded(
                  //     paddingAll: 8,
                  //     color: customTheme.muviPrimary,
                  //     child: Icon(
                  //       Icons.play_arrow,
                  //       color: customTheme.muviOnPrimary,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    'Trending',
                    fontWeight: 600,
                  ),
                  FxText.bodySmall(
                    'See All',
                    color: customTheme.muviPrimary,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildTrendingList(),
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.bodyMedium(
                    'Hollywood',
                    fontWeight: 600,
                  ),
                  FxText.bodySmall(
                    'See All',
                    color: customTheme.muviPrimary,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildHollyWoodList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
