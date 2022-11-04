import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController profileController;

  @override
  void initState() {
    super.initState();
    profileController =
        FxControllerStore.putOrFind<ProfileController>(ProfileController());
    theme = AppTheme.homemadeTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: profileController,
        builder: (profileController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (profileController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 48, 24, 24),
          children: [
            FxContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(profileController.user.url),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  FxSpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodyLarge(profileController.user.name,
                            fontWeight: 700),
                        FxSpacing.width(8),
                        FxText.bodyMedium(
                          profileController.user.email,
                        ),
                        FxSpacing.height(8),
                        FxButton.outlined(
                            onPressed: () {},
                            splashColor:
                                theme.colorScheme.secondary.withAlpha(40),
                            borderColor: theme.colorScheme.secondary,
                            padding: FxSpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: FxText.bodySmall("Edit profile",
                                color: theme.colorScheme.secondary))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            FxContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    "Favorite Items",
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
                  inactiveTrackColor:
                      theme.colorScheme.secondary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.secondary.withAlpha(150),
                  activeColor: theme.colorScheme.secondary,
                  title: FxText.bodyMedium(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      profileController.notification = value;
                    });
                  },
                  value: profileController.notification,
                ),
                FxSpacing.height(24),
                Center(
                    child: FxButton.rounded(
                  onPressed: () {
                    profileController.logout();
                  },
                  splashColor: theme.colorScheme.primary.withAlpha(60),
                  child: FxText.labelMedium(
                    "LOGOUT",
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.5,
                  ),
                  elevation: 0,
                  backgroundColor: theme.colorScheme.primary.withAlpha(40),
                ))
              ],
            )),
            FxSpacing.height(16),
            Divider(
              thickness: 0.8,
            ),
            FxSpacing.height(8),
            FxText.bodySmall(
              "© 2021 FlutKit. Design by Coderthemes",
              muted: true,
              textAlign: TextAlign.center,
              letterSpacing: 0,
            )
          ],
        ),
      );
    }
  }
}
