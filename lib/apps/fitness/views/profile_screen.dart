import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ProfileController());
  }

  Widget _buildSingleProfileInfo(String info, IconData iconData, bool isArrow) {
    return Padding(
      padding: FxSpacing.bottom(20),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 20,
            color: customTheme.fitnessPrimary,
          ),
          FxSpacing.width(20),
          Expanded(
              child: FxText.labelMedium(
            info,
          )),
          FxSpacing.width(20),
          isArrow
              ? Icon(
                  FeatherIcons.chevronRight,
                  size: 20,
                ).autoDirection()
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 36, 20, 20),
          children: [
            Center(
              child: FxContainer.rounded(
                height: 80,
                width: 80,
                paddingAll: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(Images.fitnessProfile),
                ),
              ),
            ),
            FxSpacing.height(20),
            Center(
              child: FxText.titleMedium(
                'John Smit',
                fontWeight: 700,
              ),
            ),
            FxSpacing.height(36),
            FxContainer(
                borderRadiusAll: 4,
                onTap: () {
                  controller.goToSubscription();
                },
                color: customTheme.fitnessPrimary.withAlpha(40),
                child: Row(
                  children: [
                    Icon(
                      FeatherIcons.upload,
                      color: customTheme.fitnessPrimary,
                      size: 20,
                    ),
                    FxSpacing.width(20),
                    FxText.bodyMedium(
                      "Upgrade Your plan",
                      color: customTheme.fitnessPrimary,
                      fontWeight: 600,
                    ),
                  ],
                )),
            FxSpacing.height(20),
            _buildSingleProfileInfo('Personal', FeatherIcons.user, false),
            _buildSingleProfileInfo('Goals', FeatherIcons.award, false),
            _buildSingleProfileInfo('Groups', FeatherIcons.users, false),
            _buildSingleProfileInfo(
                'Privacy & Security', FeatherIcons.shield, true),
            _buildSingleProfileInfo(
                'Advanced Settings', FeatherIcons.settings, true),
            FxSpacing.height(16),
            Row(
              children: [
                FxText.labelMedium(
                  'Devices',
                  fontWeight: 700,
                ),
              ],
            ),
            FxSpacing.height(20),
            FxContainer(
              borderRadiusAll: 0,
              paddingAll: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.smartphone,
                        size: 24,
                        color: customTheme.fitnessPrimary,
                      ),
                      FxSpacing.width(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.labelMedium(
                              'Mobile Track',
                              fontWeight: 600,
                            ),
                            FxSpacing.height(2),
                            FxText.labelSmall(
                              'Linked to another device',
                            ),
                          ],
                        ),
                      ),
                      FxSpacing.width(20),
                      Icon(
                        FeatherIcons.moreVertical,
                        size: 20,
                        color: theme.colorScheme.onBackground,
                      ),
                    ],
                  ),
                  FxSpacing.height(20),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.plusCircle,
                        size: 24,
                        color: customTheme.fitnessPrimary,
                      ),
                      FxSpacing.width(12),
                      FxText.labelMedium(
                        'Set up a device',
                        fontWeight: 600,
                      ),
                    ],
                  )
                ],
              ),
            ),
            FxSpacing.height(20),
            FxButton.block(
              elevation: 0,
              borderRadiusAll: 4,
              backgroundColor: customTheme.fitnessPrimary.withAlpha(40),
              onPressed: () {
                controller.logout();
              },
              child: FxText.bodyMedium(
                'Log Out',
                color: customTheme.fitnessPrimary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
