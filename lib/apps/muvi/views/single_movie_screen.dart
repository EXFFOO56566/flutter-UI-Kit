import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_movie_controller.dart';
import '../models/movie.dart';

class SingleMovieScreen extends StatefulWidget {
  final Movie movie;

  const SingleMovieScreen(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleMovieScreenState createState() => _SingleMovieScreenState();
}

class _SingleMovieScreenState extends State<SingleMovieScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SingleMovieController controller;

  @override
  void initState() {
    super.initState();
    controller =
        FxControllerStore.putOrFind(SingleMovieController(widget.movie));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildCastList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(20));
    for (int i = 0; i < controller.movie.cast.length; i++) {
      list.add(
        FxContainer.rounded(
          paddingAll: 0,
          height: 70,
          width: 70,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            image: AssetImage(controller.movie.cast[i]),
            fit: BoxFit.cover,
          ),
        ),
      );

      list.add(FxSpacing.width(20));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleMovieController>(
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
          padding: FxSpacing.zero,
          children: [
            FxContainer.none(
              child: Stack(
                children: [
                  Image(
                    height: 420,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(controller.movie.image),
                  ),
                  Positioned(
                      left: 12,
                      top: FxSpacing.safeAreaTop(context) + 20,
                      child: InkWell(
                          onTap: () {
                            controller.goBack();
                          },
                          child: Icon(
                            FeatherIcons.chevronLeft,
                            size: 20,
                            color: customTheme.muviOnPrimary,
                          ))),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: FxSpacing.zero,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withAlpha(220),
                              Colors.black.withAlpha(180),
                              Colors.black.withAlpha(160),
                              Colors.black.withAlpha(140),
                              Colors.transparent
                            ],
                            stops: [
                              0.1,
                              0.25,
                              0.5,
                              0.7,
                              1
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    right: 20,
                    bottom: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              FxText.labelMedium(
                                'Available Now',
                                color: customTheme.muviOnPrimary,
                              ),
                              FxSpacing.height(4),
                              FxText.titleMedium(
                                'Watch ' + controller.movie.name,
                                fontWeight: 600,
                                color: customTheme.muviOnPrimary,
                                letterSpacing: 0.3,
                              ),
                              FxSpacing.height(6),
                              FxStarRating(
                                size: 16,
                                spacing: 4,
                                activeColor: customTheme.muviOnPrimary,
                                inactiveColor:
                                    customTheme.muviOnPrimary.withAlpha(100),
                                inactiveStarFilled: true,
                                showInactive: true,
                                rating: controller.movie.ratings,
                              ),
                            ],
                          ),
                        ),
                        FxContainer.rounded(
                          paddingAll: 8,
                          color: customTheme.muviPrimary,
                          child: Icon(
                            Icons.play_arrow,
                            color: customTheme.muviOnPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: FxSpacing.nBottom(20),
              child: FxText.bodyLarge(
                'The Plot',
                fontWeight: 600,
              ),
            ),
            Padding(
              padding: FxSpacing.xy(20, 12),
              child: RichText(
                text: TextSpan(
                  text: controller.movie.description,
                  style: FxTextStyle.bodySmall(letterSpacing: 0.2),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' See more ...',
                        style: TextStyle(color: customTheme.muviPrimary)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: FxSpacing.x(20),
              child: RichText(
                text: TextSpan(
                  text: 'Director : ',
                  style: FxTextStyle.bodySmall(
                      letterSpacing: 0.2, color: customTheme.muviPrimary),
                  children: <TextSpan>[
                    TextSpan(
                        text: controller.movie.director,
                        style: FxTextStyle.bodySmall(
                            color: theme.colorScheme.onBackground)),
                  ],
                ),
              ),
            ),
            FxSpacing.height(4),
            Padding(
              padding: FxSpacing.x(20),
              child: RichText(
                text: TextSpan(
                  text: 'Writer : ',
                  style: FxTextStyle.bodySmall(
                      letterSpacing: 0.2, color: customTheme.muviPrimary),
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.movie.writer,
                      style: FxTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: FxText.bodyLarge(
                'The Cast',
                fontWeight: 600,
              ),
            ),
            FxSpacing.height(8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildCastList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
