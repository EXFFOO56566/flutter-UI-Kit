import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/profile_controller.dart';

class EstateProfileScreen extends StatefulWidget {
  const EstateProfileScreen({Key? key}) : super(key: key);

  @override
  _EstateProfileScreenState createState() => _EstateProfileScreenState();
}

class _EstateProfileScreenState extends State<EstateProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateProfileController estateProfileController;

  @override
  void initState() {
    super.initState();
    estateProfileController =
        FxControllerStore.putOrFind(EstateProfileController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        FxContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: customTheme.estatePrimary,
            size: 20,
          ),
        ),
        FxSpacing.width(16),
        Expanded(
          child: FxText.bodySmall(
            title!,
            letterSpacing: 0.5,
          ),
        ),
        FxSpacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateProfileController>(
        controller: estateProfileController,
        builder: (estateProfileController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 2,
                    child: estateProfileController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
                            minHeight: 2,
                          )
                        : Container(
                            height: 2,
                          ),
                  ),
                  Expanded(
                    child: _buildBody(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateProfileController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: FxSpacing.all(24),
        children: [
          Center(
            child: FxContainer(
              paddingAll: 0,
              borderRadiusAll: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/profile/avatar_4.jpg'),
                ),
              ),
            ),
          ),
          FxSpacing.height(24),
          FxText.titleLarge(
            'Bessie Cooper',
            textAlign: TextAlign.center,
            fontWeight: 600,
            letterSpacing: 0.8,
          ),
          FxSpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxContainer.rounded(
                color: customTheme.estatePrimary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              FxSpacing.width(6),
              FxText.labelMedium(
                'Premium (9 days)',
                color: customTheme.estatePrimary,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          FxSpacing.height(24),
          FxText.bodySmall(
            'General',
            color: theme.colorScheme.onBackground,
            xMuted: true,
          ),
          FxSpacing.height(24),
          _buildSingleRow(
              title: 'Subscription & payment', icon: FeatherIcons.creditCard),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Profile settings', icon: FeatherIcons.user),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Password', icon: FeatherIcons.lock),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Notifications', icon: FeatherIcons.bell),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Logout', icon: FeatherIcons.logOut),
        ],
      );
    }
  }
}
