import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/utils/spacing.dart';

class FxTwoToneIconsScreen extends StatefulWidget {
  @override
  _FxTwoToneIconsScreenState createState() => _FxTwoToneIconsScreenState();
}

class _FxTwoToneIconsScreenState extends State<FxTwoToneIconsScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.vertical(16),
        children: [
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 4,
              padding: FxSpacing.all(8),
              mainAxisSpacing: 24,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 24,
              children: <Widget>[
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.panorama_fish_eye,
                  color: customTheme.violet,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.add_circle,
                  color: customTheme.violet,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.play_circle_filled,
                  color: customTheme.violet,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.account_circle,
                  color: customTheme.violet,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.check_box,
                  color: customTheme.indigo,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.add_box,
                  color: customTheme.indigo,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.slideshow,
                  color: customTheme.indigo,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.account_box,
                  color: customTheme.indigo,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.change_history,
                  color: CustomTheme.blue,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.warning,
                  color: CustomTheme.blue,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.details,
                  color: CustomTheme.blue,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.eject,
                  color: CustomTheme.blue,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.face,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.sentiment_very_satisfied,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.sentiment_neutral,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.sentiment_very_dissatisfied,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.home,
                  color: CustomTheme.orange,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.home_work,
                  color: CustomTheme.orange,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.deck,
                  color: CustomTheme.orange,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.night_shelter,
                  color: CustomTheme.orange,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.admin_panel_settings,
                  color: CustomTheme.red,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.bookmark,
                  color: CustomTheme.red,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.extension,
                  color: CustomTheme.red,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.pan_tool,
                  color: CustomTheme.red,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.star,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.star_half,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.stars,
                  color: CustomTheme.green,
                ),
                FxTwoToneIcon(
                  FxTwoToneMdiIcons.new_releases,
                  color: CustomTheme.green,
                ),
              ]),
        ],
      ),
    );
  }
}
