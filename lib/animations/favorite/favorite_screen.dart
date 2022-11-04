import 'package:flare_flutter/flare_actor.dart';
import 'package:flutkit/animations/favorite/favorite_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late FavoriteController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    controller = FxControllerStore.putOrFind(FavoriteController(this));
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<FavoriteController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                child: Icon(
                  FeatherIcons.chevronLeft,
                  color: Colors.white,
                ),
                onTap: () {
                  controller.goBack();
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxText.bodyLarge("Flare Animation"),
                  FxSpacing.height(20),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.onClick();
                      },
                      child: FlareActor(
                        "assets/animations/rive/favorite.flr",
                        snapToEnd: false,
                        animation: controller.status,
                        shouldClip: false,
                      ),
                    ),
                  ),
                  FxSpacing.height(50),
                  FxText.bodyLarge("Custom Animation"),
                  FxSpacing.height(20),
                  AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (BuildContext context, _) {
                      return FxContainer(
                        color: theme.scaffoldBackgroundColor,
                        paddingAll: controller.paddingAnimation.value,
                        borderRadiusAll: 0,
                        onTap: () {
                          controller.isFav
                              ? controller.animationController.reverse()
                              : controller.animationController.forward();
                        },
                        child: Icon(
                          Icons.favorite,
                          color: controller.colorAnimation.value,
                          size: controller.sizeAnimation.value,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
