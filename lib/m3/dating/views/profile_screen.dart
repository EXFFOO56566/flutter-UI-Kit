import 'package:flutkit/loading_effect.dart';
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
    controller =
        FxControllerStore.putOrFind<ProfileController>(ProfileController());
    theme = AppTheme.datingTheme;
  }

  Widget _buildSingleRow(String info, IconData icon) {
    return FxContainer(
      borderRadiusAll: Constant.containerRadius.medium,
      margin: FxSpacing.bottom(16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: theme.colorScheme.secondary,
          ),
          FxSpacing.width(16),
          Expanded(
            child: FxText.bodySmall(
              info,
              fontWeight: 600,
            ),
          ),
          FxSpacing.width(16),
          Icon(
            FeatherIcons.chevronDown,
            color: theme.colorScheme.onBackground,
            size: 16,
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
              margin: FxSpacing.top(24),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.titleMedium(
            'Profile',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Column(
          children: [
            FxContainer(
              borderRadiusAll: Constant.containerRadius.large,
              margin: FxSpacing.fromLTRB(24, 4, 24, 0),
              paddingAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer.rounded(
                        paddingAll: 0,
                        margin: FxSpacing.right(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 64,
                          width: 64,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/profile.jpg'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyMedium(
                            'Taylor Swift, 22',
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.bodySmall(
                            'Project Manager, Cloud Infotech',
                            xMuted: true,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.bodySmall(
                            'Bangkok, Malaysia',
                            fontWeight: 600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(12),
                  Row(
                    children: [
                      FxContainer(
                        margin: FxSpacing.right(8),
                        child: FxText.bodySmall(
                          'Travelling',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                      ),
                      FxContainer(
                        margin: FxSpacing.right(8),
                        child: FxText.bodySmall(
                          'Diving',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                      ),
                      FxContainer(
                        margin: FxSpacing.right(8),
                        child: FxText.bodySmall(
                          'Reading',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                      ),
                      FxContainer(
                        margin: FxSpacing.right(8),
                        child: FxText.bodySmall(
                          'Trekking',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.bodySmall(
                    'I\'m taylor from Texas. I am looking for special person also I want to meet different people and learn new things from different cultures and visit new places.',
                    xMuted: true,
                    fontSize: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: FxSpacing.all(24),
              child: Column(
                children: [
                  _buildSingleRow('Detailed Info', FeatherIcons.alertCircle),
                  _buildSingleRow('Matches', FeatherIcons.heart),
                  _buildSingleRow('Profile Stats', FeatherIcons.activity),
                  _buildSingleRow('Notes', Icons.notes),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
