import 'package:flutkit/homes/select_language_dialog.dart';
import 'package:flutkit/theme/theme_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({Key? key}) : super(key: key);

  @override
  _AppSettingScreenState createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  bool isDark = false;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void changeDirection() {
    if (AppTheme.textDirection == TextDirection.ltr) {
      Provider.of<AppNotifier>(context, listen: false)
          .changeDirectionality(TextDirection.rtl);
    } else {
      Provider.of<AppNotifier>(context, listen: false)
          .changeDirectionality(TextDirection.ltr);
    }
    setState(() {});
  }

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.dark);
    } else {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.light);
    }

    setState(() {});
  }

  void launchCodecanyonURL() async {
    String url = "https://1.envato.market/flutkit";
    await launch(url);
  }

  void launchDocumentation() async {
    String url = "https://flutkit.coderthemes.com/index.html";
    await launch(url);
  }

  void launchChangeLog() async {
    String url = "https://flutkit.coderthemes.com/changlog.html";
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        theme = AppTheme.theme;
        customTheme = AppTheme.customTheme;
        isDark = AppTheme.themeType == ThemeType.dark;
        return Theme(
          data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                  secondary: theme.colorScheme.primary.withAlpha(80))),
          child: Scaffold(
            body: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  Navigator.pop(context);
                }
              },
              child: ListView(
                padding: FxSpacing.fromLTRB(20, 48, 20, 20),
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FeatherIcons.chevronLeft,
                          size: 20,
                          color: theme.colorScheme.onBackground,
                        ).autoDirection(),
                      ),
                      FxSpacing.width(16),
                      FxText.titleMedium(
                        "settings".tr(),
                        fontWeight: 600,
                      ),
                    ],
                  ),
                  FxSpacing.height(20),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              SelectLanguageDialog());
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        FxContainer(
                          paddingAll: 12,
                          borderRadiusAll: 4,
                          child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(Images.languageOutline),
                            color: CustomTheme.peach,
                          ),
                          color: CustomTheme.peach.withAlpha(20),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: FxText.bodyLarge(
                            'language'.tr(),
                          ),
                        ),
                        FxSpacing.width(16),
                        Icon(
                          FeatherIcons.chevronRight,
                          size: 18,
                          color: theme.colorScheme.onBackground,
                        ).autoDirection(),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  InkWell(
                    onTap: () {
                      changeDirection();
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        FxContainer(
                          paddingAll: 12,
                          borderRadiusAll: 4,
                          child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(
                                AppTheme.textDirection == TextDirection.ltr
                                    ? Images.paragraphRTLOutline
                                    : Images.paragraphLTROutline),
                            color: CustomTheme.skyBlue,
                          ),
                          color: CustomTheme.skyBlue.withAlpha(20),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: FxText.bodyLarge(
                            AppTheme.textDirection == TextDirection.ltr
                                ? 'right_to_left'.tr() + " (RTL)"
                                : 'left_to_right'.tr() + " (LTR)",
                          ),
                        ),
                        FxSpacing.width(16),
                        Icon(
                          FeatherIcons.chevronRight,
                          size: 18,
                          color: theme.colorScheme.onBackground,
                        ).autoDirection(),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  InkWell(
                    onTap: () {
                      changeTheme();
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        FxContainer(
                          paddingAll: 12,
                          borderRadiusAll: 4,
                          color: CustomTheme.occur.withAlpha(28),
                          child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(!isDark
                                ? Images.darkModeOutline
                                : Images.lightModeOutline),
                            color: CustomTheme.occur,
                          ),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: FxText.bodyLarge(
                            !isDark ? 'dark_mode'.tr() : 'light_mode'.tr(),
                          ),
                        ),
                        FxSpacing.width(16),
                        Icon(
                          FeatherIcons.chevronRight,
                          size: 18,
                          color: theme.colorScheme.onBackground,
                        ).autoDirection(),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  Divider(),
                  FxSpacing.height(20),
                  InkWell(
                    onTap: () {
                      launchDocumentation();
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        FxContainer(
                          paddingAll: 12,
                          borderRadiusAll: 4,
                          child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(Images.documentationIcon),
                            color: CustomTheme.skyBlue,
                          ),
                          color: CustomTheme.skyBlue.withAlpha(20),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: FxText.bodyLarge(
                            'documentation'.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  InkWell(
                    onTap: () {
                      launchChangeLog();
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        FxContainer(
                          paddingAll: 12,
                          borderRadiusAll: 4,
                          child: Image(
                            height: 20,
                            width: 20,
                            image: AssetImage(Images.changeLogIcon),
                            color: CustomTheme.peach,
                          ),
                          color: CustomTheme.peach.withAlpha(20),
                        ),
                        FxSpacing.width(16),
                        Expanded(
                          child: FxText.bodyLarge(
                            'changelog'.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(20),
                  Center(
                    child: FxButton(
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {
                        launchCodecanyonURL();
                      },
                      splashColor: theme.colorScheme.onPrimary.withAlpha(40),
                      child: FxText.labelMedium(
                        'buy_now'.tr(),
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.5,
                      ),
                      backgroundColor: theme.colorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
