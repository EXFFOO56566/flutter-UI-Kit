import 'package:flutkit/theme/app_theme.dart';

import '../../../loading_effect.dart';
import '../controllers/matched_profile_controller.dart';
import '../models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DatingMatchedProfileScreen extends StatefulWidget {
  final Profile profile;
  const DatingMatchedProfileScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _DatingMatchedProfileScreenState createState() =>
      _DatingMatchedProfileScreenState();
}

class _DatingMatchedProfileScreenState
    extends State<DatingMatchedProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingMatchedProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<DatingMatchedProfileController>(
        DatingMatchedProfileController(widget.profile));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DatingMatchedProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: FxSpacing.top(24),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.9,
                child: Image(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/apps/dating/wallpaper.jpg',
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FxText.headlineMedium(
                      'It\'s Awesome !!',
                      fontWeight: 700,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                    FxSpacing.height(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FxContainer.rounded(
                          paddingAll: 0,
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(controller.profile.image),
                          ),
                        ),
                        FxSpacing.width(16),
                        FxContainer.rounded(
                          paddingAll: 0,
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/apps/dating/profile.jpg'),
                          ),
                        ),
                      ],
                    ),
                    FxSpacing.height(56),
                    Padding(
                      padding: FxSpacing.x(40),
                      child: FxText.bodyMedium(
                        'You both like each other, ask her about something interesting',
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        muted: true,
                      ),
                    ),
                    FxSpacing.height(56),
                    Padding(
                      padding: FxSpacing.x(32),
                      child: FxButton.block(
                        onPressed: () {
                          controller.goToChatScreen();
                        },
                        borderRadiusAll: 4,
                        elevation: 0,
                        backgroundColor: customTheme.datingPrimary,
                        child: FxText.bodyMedium(
                          'Say Hello',
                          fontWeight: 600,
                          letterSpacing: 0.5,
                          color: customTheme.datingOnPrimary,
                        ),
                      ),
                    ),
                    FxSpacing.height(24),
                    Padding(
                      padding: FxSpacing.x(32),
                      child: FxButton.block(
                        onPressed: () {
                          controller.goToHomeScreen();
                        },
                        borderRadiusAll: 4,
                        elevation: 0,
                        backgroundColor:
                            customTheme.datingOnPrimary.withAlpha(200),
                        child: FxText.bodyMedium(
                          'Keep Swiping',
                          fontWeight: 600,
                          letterSpacing: 0.5,
                          color: customTheme.datingPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
