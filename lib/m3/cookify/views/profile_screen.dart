import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/profile_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../theme/constant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController controller;

  bool notification = true, offlineReading = false;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
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
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            FxContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(controller.user.image),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  FxSpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodyLarge(controller.user.name, fontWeight: 700),
                        FxSpacing.width(8),
                        FxText.bodyMedium(
                          controller.user.email,
                        ),
                        FxSpacing.height(8),
                        FxButton.outlined(
                            onPressed: () {},
                            splashColor: theme.colorScheme.primaryContainer,
                            borderColor: theme.colorScheme.primary,
                            padding: FxSpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: FxText.bodySmall("Edit profile",
                                color: theme.colorScheme.primary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(24),
            FxContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.titleMedium(
                  "Option",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: theme.colorScheme.primary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.primary.withAlpha(150),
                  activeColor: theme.colorScheme.primary,
                  title: FxText.bodyMedium(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      notification = value;
                    });
                  },
                  value: notification,
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.bodyMedium(
                    "Language",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: theme.colorScheme.primary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.primary.withAlpha(150),
                  activeColor: theme.colorScheme.primary,
                  title: FxText.bodyMedium(
                    "Offline Reading",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      offlineReading = value;
                    });
                  },
                  value: offlineReading,
                ),
                Divider(
                  thickness: 0.8,
                ),
                FxSpacing.height(8),
                FxText.titleMedium(
                  "Account",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.bodyMedium(
                    "Personal Information",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.bodyMedium(
                    "Country",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.bodyMedium(
                    "Favorite Recipes",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                FxSpacing.height(16),
                Center(
                    child: FxButton.rounded(
                  onPressed: () {
                    controller.logout();
                  },
                  child: FxText.labelLarge(
                    "LOGOUT",
                    color: theme.colorScheme.onPrimary,
                  ),
                  elevation: 0,
                  borderRadiusAll: Constant.buttonRadius.large,
                  splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                  backgroundColor: theme.colorScheme.primary,
                ))
              ],
            )),
            FxSpacing.height(24),
            FxContainer(
                color: theme.colorScheme.primaryContainer,
                padding: FxSpacing.xy(16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FxTwoToneIcon(
                      FxTwoToneMdiIcons.headset_mic,
                      size: 32,
                      color: theme.colorScheme.primary,
                    ),
                    FxSpacing.width(12),
                    FxText.bodySmall(
                      "Feel Free to Ask, We Ready to Help",
                      color: theme.colorScheme.primary,
                      letterSpacing: 0,
                    )
                  ],
                ))
          ],
        ),
      );
    }
  }
}
