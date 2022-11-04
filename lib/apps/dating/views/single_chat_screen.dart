import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_chat_controller.dart';
import '../models/profile.dart';

class DatingSingleChatScreen extends StatefulWidget {
  final Profile profile;

  const DatingSingleChatScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _DatingSingleChatScreenState createState() => _DatingSingleChatScreenState();
}

class _DatingSingleChatScreenState extends State<DatingSingleChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingSingleChatController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<DatingSingleChatController>(
        DatingSingleChatController(widget.profile));
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DatingSingleChatController>(
        controller: controller,
        builder: (controller) {
          return Theme(
              data: theme.copyWith(
                  colorScheme: theme.colorScheme
                      .copyWith(secondary: customTheme.datingPrimary)),
              child: _buildBody());
        });
  }

  Widget _buildSingleTime(String time) {
    return Align(
        alignment: Alignment.center,
        child: FxText.labelSmall(
          time,
          xMuted: true,
          fontWeight: 600,
        ));
  }

  Widget _buildSingleMessage(String message,
      AlignmentGeometry alignmentGeometry, Color bgColor, Color textColor) {
    return Align(
      alignment: alignmentGeometry,
      child: FxContainer(
        color: bgColor,
        paddingAll: 12,
        borderRadiusAll: 8,
        margin: FxSpacing.y(8),
        child: FxText.bodySmall(
          message,
          color: textColor,
        ),
      ),
    );
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
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: Column(
            children: [
              Padding(
                padding: FxSpacing.x(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.goBack();
                      },
                      child: Icon(
                        FeatherIcons.chevronLeft,
                        size: 20,
                        color: customTheme.datingPrimary,
                      ),
                    ),
                    FxSpacing.width(12),
                    FxContainer.rounded(
                      paddingAll: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage(controller.profile.image),
                      ),
                    ),
                    FxSpacing.width(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodySmall(
                          controller.profile.name +
                              ', ' +
                              controller.profile.age.toString(),
                          fontWeight: 600,
                        ),
                        FxSpacing.height(4),
                        FxText.labelSmall(
                          controller.profile.profession +
                              ', ' +
                              controller.profile.companyName,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(8),
              Divider(
                thickness: 1.2,
                color: customTheme.card,
              ),
              Expanded(
                child: ListView(
                  padding: FxSpacing.all(24),
                  children: [
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleTime('08:35'),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                    _buildSingleTime('08:37'),
                    _buildSingleMessage(
                        'For sure, how about this \nbeautiful place?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: 16,
                        margin: FxSpacing.y(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 120,
                          width: 250,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/location.png'),
                        ),
                      ),
                    ),
                    _buildSingleMessage(
                        'Perfect!!',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                    _buildSingleTime('08:42'),
                    _buildSingleMessage(
                        'What time should we be there?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        customTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        customTheme.datingPrimary.withAlpha(40),
                        customTheme.datingPrimary),
                  ],
                ),
              ),
              FxContainer(
                paddingAll: 0,
                margin: FxSpacing.nTop(16),
                child: FxTextField(
                  focusedBorderColor: customTheme.datingPrimary,
                  cursorColor: customTheme.datingPrimary,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  labelText: 'Type Something ...',
                  labelStyle: FxTextStyle.bodySmall(
                      color: theme.colorScheme.onBackground, muted: true),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: customTheme.card,
                  suffixIcon: Icon(
                    FeatherIcons.send,
                    color: customTheme.datingPrimary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
