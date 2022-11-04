import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
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
  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image(),
                    FxSpacing.height(4),
                    Align(
                        alignment: Alignment.center,
                        child: FxText.titleMedium(
                          "John Micheal",
                          fontWeight: 700,
                        )),
                    FxSpacing.height(4),
                    verified(),
                    FxSpacing.height(20),
                    settings(),
                    FxSpacing.height(16),
                    logout(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget image() {
    return Center(
      child: FxContainer.rounded(
        height: 100,
        paddingAll: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/full_apps/nft/images/profile.jpg'),
        ),
      ),
    );
  }

  Widget verified() {
    return Align(
      alignment: Alignment.center,
      child: FxContainer(
        padding: FxSpacing.fromLTRB(6, 4, 12, 4),
        borderRadiusAll: Constant.containerRadius.large,
        color: theme.colorScheme.primaryContainer,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: theme.colorScheme.onPrimaryContainer,
              size: 16,
            ),
            FxSpacing.width(8),
            FxText.bodySmall(
              "Verified",
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: 600,
            ),
          ],
        ),
      ),
    );
  }

  Widget settings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxText.bodyMedium(
          "Account Settings",
          fontWeight: 700,
          xMuted: true,
        ),
        FxSpacing.height(20),
        singleRow(Icons.dashboard, "Dashboard", "Your portfolio assets"),
        Divider(),
        FxSpacing.height(8),
        singleRow(Icons.admin_panel_settings, "Privacy Setting",
            "PIN & Biometric security"),
        FxSpacing.height(20),
        FxText.bodyMedium(
          "General Settings",
          fontWeight: 700,
          xMuted: true,
        ),
        FxSpacing.height(20),
        singleRow(
            Icons.account_balance, "Bank Account", "Manage your account bank"),
        Divider(),
        FxSpacing.height(8),
        singleRow(
            Icons.notifications, "Notification", "Manage your notification"),
        Divider(),
        FxSpacing.height(8),
        singleRow(Icons.redeem, "Refferal Code", "Manage your notification"),
      ],
    );
  }

  Widget singleRow(IconData icon, String title, String subTitle) {
    return Padding(
      padding: FxSpacing.bottom(8),
      child: Row(
        children: [
          FxContainer.rounded(
            paddingAll: 12,
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          FxSpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyMedium(
                  title,
                  fontWeight: 600,
                ),
                FxSpacing.height(2),
                FxText.bodySmall(subTitle),
              ],
            ),
          ),
          FxSpacing.width(20),
          Icon(
            FeatherIcons.chevronRight,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget logout() {
    return Align(
      alignment: Alignment.center,
      child: FxButton.small(
        elevation: 0,
        onPressed: () {
          controller.goBack();
        },
        borderRadiusAll: Constant.buttonRadius.xs,
        padding: FxSpacing.xy(16, 8),
        child: FxText.labelLarge(
          "Logout",
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
