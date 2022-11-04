import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../loading_effect.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;

  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.putOrFind(ProfileController());
  }

  Widget _buildSingleRow(String name, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        FxSpacing.width(20),
        Expanded(
            child: FxText.bodyMedium(
          name,
          fontWeight: 600,
        )),
        FxSpacing.width(20),
        Icon(
          FeatherIcons.chevronRight,
          size: 20,
        ),
      ],
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
        body: Container(
            margin: FxSpacing.top(20),
            child: LoadingEffect.getReviewLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            FxText.bodySmall(
              'ACCOUNT',
              fontWeight: 700,
              letterSpacing: 0.2,
              muted: true,
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Icon(
                  FeatherIcons.user,
                  size: 20,
                ),
                FxSpacing.width(20),
                Expanded(
                    child: FxText.bodyMedium('My account', fontWeight: 600)),
                FxSpacing.width(20),
                FxContainer(
                  onTap: () {
                    controller.logout();
                  },
                  padding: FxSpacing.xy(20, 8),
                  borderRadiusAll: 4,
                  color: theme.colorScheme.primary,
                  child: FxText.bodySmall(
                    'Log Out',
                    fontWeight: 700,
                    letterSpacing: 0.3,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            InkWell(
              onTap: () {
                controller.goToSubscription();
              },
              child: Row(
                children: [
                  Icon(
                    FeatherIcons.checkCircle,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  FxSpacing.width(20),
                  FxText.bodyMedium('Subscriptions',
                      color: theme.colorScheme.primary, fontWeight: 600),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxText.bodySmall(
              'CONTENT & ACTIVITY',
              fontWeight: 700,
              letterSpacing: 0.2,
              muted: true,
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Icon(
                  FeatherIcons.globe,
                  size: 20,
                ),
                FxSpacing.width(20),
                Expanded(
                    child: FxText.bodyMedium(
                  'App Language',
                  fontWeight: 600,
                )),
                FxSpacing.width(20),
                FxText.bodyMedium(
                  'English',
                  fontWeight: 600,
                  muted: true,
                ),
                FxSpacing.width(4),
                Icon(
                  FeatherIcons.chevronRight,
                  size: 20,
                ),
              ],
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Icon(
                  FeatherIcons.dollarSign,
                  size: 20,
                ),
                FxSpacing.width(20),
                Expanded(
                    child: FxText.bodyMedium(
                  'Currency',
                  fontWeight: 600,
                )),
                FxSpacing.width(20),
                FxText.bodyMedium(
                  'USD',
                  fontWeight: 700,
                ),
              ],
            ),
            FxSpacing.height(20),
            _buildSingleRow('Dark Mode', FeatherIcons.moon),
            FxSpacing.height(20),
            FxText.bodySmall(
              'SUPPORT',
              fontWeight: 700,
              letterSpacing: 0.2,
              muted: true,
            ),
            FxSpacing.height(20),
            _buildSingleRow('Report a problem', FeatherIcons.alertOctagon),
            FxSpacing.height(20),
            _buildSingleRow('Help center', FeatherIcons.alertCircle),
            FxSpacing.height(20),
            FxText.bodySmall(
              'ABOUT',
              fontWeight: 700,
              letterSpacing: 0.2,
              muted: true,
            ),
            FxSpacing.height(20),
            _buildSingleRow('Community Guidelines', FeatherIcons.eye),
            FxSpacing.height(20),
            _buildSingleRow('Terms of Use', FeatherIcons.bookmark),
            FxSpacing.height(20),
            _buildSingleRow('Location', FeatherIcons.mapPin),
            FxSpacing.height(20),
            Divider(
              thickness: 0.8,
            ),
            FxSpacing.height(8),
            FxContainer(
              color: theme.colorScheme.primary.withAlpha(28),
              borderRadiusAll: 4,
              child: FxText.bodyMedium(
                "© 2022 Flutkit, Design by Coderthemes",
                textAlign: TextAlign.center,
                fontWeight: 600,
                letterSpacing: 0.2,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
