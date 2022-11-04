import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

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

  Widget _buildSingleRow(String name, IconData icon) {
    return Padding(
      padding: FxSpacing.y(6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onBackground,
          ),
          FxSpacing.width(20),
          Expanded(
              child: FxText.bodyMedium(
            name,
          )),
          FxSpacing.width(20),
          Icon(
            FeatherIcons.chevronRight,
            size: 20,
            color: theme.colorScheme.onBackground,
          ),
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
        body: Container(
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: FxText.titleMedium(
            'Profile',
            fontWeight: 600,
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          children: [
            _buildSingleRow('Edit Profile', FeatherIcons.user),
            Divider(),
            _buildSingleRow('My Notifications', FeatherIcons.bell),
            Divider(),
            _buildSingleRow('Watchlist', FeatherIcons.eye),
            Divider(),
            _buildSingleRow('Language', FeatherIcons.globe),
            Divider(),
            _buildSingleRow('Category', FeatherIcons.grid),
            Divider(),
            _buildSingleRow('App Settings', FeatherIcons.settings),
            Divider(),
            _buildSingleRow('Referrals', FeatherIcons.users),
            Divider(),
            _buildSingleRow('Feedback & Help', FeatherIcons.headphones),
            Divider(),
            _buildSingleRow('Management Subscriptions', FeatherIcons.youtube),
            Divider(),
            FxSpacing.height(20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Terms of Use',
                  style: FxTextStyle.bodySmall(
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.2,
                      color: customTheme.muviPrimary),
                  children: <TextSpan>[
                    TextSpan(
                      text: '  and  ',
                      style: FxTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground),
                    ),
                    TextSpan(
                      text: 'Privacy policy',
                      style: FxTextStyle.bodySmall(
                          decoration: TextDecoration.underline,
                          color: customTheme.muviPrimary),
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            FxButton.block(
              onPressed: () {
                controller.logout();
              },
              elevation: 0,
              borderRadiusAll: 4,
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              child: FxText.labelMedium(
                'Sign Out',
                fontWeight: 600,
                color: customTheme.muviOnPrimary,
              ),
            ),
            FxSpacing.height(20),
            Divider(),
            FxSpacing.height(20),
            FxText.labelMedium(
              "© 2021 FlutKit, Design by Coderthemes",
              textAlign: TextAlign.center,
              letterSpacing: 0.2,
              color: customTheme.muviPrimary,
            ),
          ],
        ),
      );
    }
  }
}
