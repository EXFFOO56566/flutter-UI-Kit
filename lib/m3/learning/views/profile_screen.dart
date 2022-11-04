import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'package:flutkit/images.dart';
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
    theme = AppTheme.learningTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
  }

  Widget _buildSingleSetting(
      String setting, String subSetting, IconData icon, Color? color) {
    return Padding(
      padding: FxSpacing.y(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          FxSpacing.width(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.titleSmall(setting, fontWeight: 600, color: color),
              FxSpacing.height(4),
              FxText.bodySmall(
                subSetting,
                fontWeight: 600,
                xMuted: true,
                fontSize: 10,
              ),
            ],
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
        body: LoadingEffect.getSearchLoadingScreen(context),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.x(20),
          child: Column(
            children: [
              Center(
                child: FxContainer(
                  onTap: () {
                    controller.goToEditProfile();
                  },
                  color: Colors.transparent,
                  paddingAll: 0,
                  borderRadiusAll: 4,
                  height: 100,
                  width: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(Images.learningProfile),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: FxCard(
                          paddingAll: 2,
                          borderRadiusAll: 4,
                          clipBehavior: Clip.none,
                          child: FxContainer(
                            paddingAll: 4,
                            borderRadiusAll: 4,
                            color: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FxSpacing.height(20),
              FxText.bodyLarge(
                'Naira Grey',
                fontWeight: 700,
              ),
              FxSpacing.height(20),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '22',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Courses',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '15',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Mentors',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        FxText.bodyMedium(
                          '38',
                          fontWeight: 700,
                        ),
                        FxSpacing.height(6),
                        FxText.bodySmall(
                          'Friends',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              Divider(),
              _buildSingleSetting('Preferences', 'Themes, Settings',
                  FeatherIcons.settings, theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting(
                  'Notification',
                  'Ringtone, Message, Notification',
                  FeatherIcons.bell,
                  theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting('Help', 'Contact Us',
                  FeatherIcons.messageCircle, theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting('About', 'About the application',
                  FeatherIcons.alertCircle, theme.colorScheme.onBackground),
              Divider(),
              InkWell(
                onTap: () {
                  controller.logout();
                },
                child: _buildSingleSetting('Log Out', 'Exit from your account',
                    FeatherIcons.logOut, theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      );
    }
  }
}
