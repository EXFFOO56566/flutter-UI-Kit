import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_profile_controller.dart';
import '../models/profile.dart';

class DatingSingleProfileScreen extends StatefulWidget {
  final Profile profile;

  const DatingSingleProfileScreen(this.profile, {Key? key}) : super(key: key);

  @override
  _DatingSingleProfileScreenState createState() =>
      _DatingSingleProfileScreenState();
}

class _DatingSingleProfileScreenState extends State<DatingSingleProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingSingleProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<DatingSingleProfileController>(
        DatingSingleProfileController(widget.profile));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildInterestList() {
    List<Widget> list = [];

    for (String interest in controller.profile.interests) {
      list.add(FxContainer.bordered(
        child: FxText.bodySmall(
          interest,
          color: customTheme.datingPrimary,
        ),
        padding: FxSpacing.xy(8, 4),
        borderRadiusAll: 4,
        border: Border.all(color: customTheme.datingPrimary),
        color: customTheme.datingPrimary.withAlpha(30),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DatingSingleProfileController>(
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
              child: LoadingEffect.getProductLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxContainer.bordered(
                  onTap: () {
                    controller.goBack();
                  },
                  paddingAll: 8,
                  borderRadiusAll: 4,
                  border: Border.all(color: customTheme.datingPrimary),
                  color: customTheme.datingPrimary.withAlpha(30),
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                    color: customTheme.datingPrimary,
                  ),
                ),
                FxContainer.bordered(
                  onTap: () {
                    controller.goToSingleChatScreen();
                  },
                  paddingAll: 8,
                  borderRadiusAll: 4,
                  border: Border.all(color: customTheme.datingPrimary),
                  color: customTheme.datingPrimary.withAlpha(30),
                  child: Icon(
                    FeatherIcons.messageCircle,
                    size: 20,
                    color: customTheme.datingPrimary,
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            FxContainer(
              height: 400,
              paddingAll: 0,
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(controller.profile.image),
              ),
            ),
            FxSpacing.height(16),
            Row(
              children: [
                Expanded(
                  child: FxText.titleLarge(
                    controller.profile.name,
                    fontWeight: 700,
                  ),
                ),
                FxSpacing.width(16),
                Icon(
                  FeatherIcons.instagram,
                  size: 20,
                  color: customTheme.datingPrimary,
                ),
                FxSpacing.width(12),
                Icon(
                  FeatherIcons.facebook,
                  size: 20,
                  color: customTheme.datingPrimary,
                ),
                FxSpacing.width(2),
              ],
            ),
            FxSpacing.height(4),
            FxText.labelMedium(
              controller.profile.profession +
                  ', ' +
                  controller.profile.companyName,
              xMuted: true,
            ),
            FxSpacing.height(16),
            FxText.titleMedium(
              'About',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            FxSpacing.height(8),
            FxText.bodySmall(
              controller.profile.description,
              xMuted: true,
            ),
            FxSpacing.height(16),
            FxText.titleMedium(
              'Interest',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            FxSpacing.height(16),
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: _buildInterestList(),
            ),
          ],
        ),
      );
    }
  }
}
