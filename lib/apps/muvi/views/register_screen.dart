import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(RegisterController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: FxSpacing.top(100),
          children: [
            Image(
              height: 80,
              image: AssetImage('assets/images/apps/muvi/profile.png'),
            ),
            FxSpacing.height(12),
            FxText.bodyLarge(
              'Register',
              fontWeight: 700,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(4),
            FxText.labelMedium(
              'Enter your details below to \nregister yourself with us.',
              xMuted: true,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(20),
            Divider(),
            FxSpacing.height(20),
            FxContainer.bordered(
              borderRadiusAll: 4,
              margin: FxSpacing.x(20),
              color: customTheme.card,
              padding: FxSpacing.y(6),
              child: Column(
                children: [
                  FxTextField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    autoIcon: false,
                    labelText: 'Email',
                    isCollapsed: true,
                    scrollPadding: EdgeInsets.zero,
                    contentPadding: FxSpacing.xy(16, 6),
                    isDense: true,
                    textColor: theme.colorScheme.onBackground.withAlpha(200),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: FxTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground),
                  ),
                  Divider(),
                  FxTextField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    autoIcon: false,
                    labelText: 'Username',
                    isCollapsed: true,
                    scrollPadding: EdgeInsets.zero,
                    contentPadding: FxSpacing.xy(16, 6),
                    isDense: true,
                    textColor: theme.colorScheme.onBackground.withAlpha(200),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: FxTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground),
                  ),
                  Divider(),
                  FxTextField(
                    maxLines: 1,
                    cursorColor: theme.colorScheme.onBackground,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    autoIcon: false,
                    labelText: 'Password',
                    isCollapsed: true,
                    scrollPadding: EdgeInsets.zero,
                    contentPadding: FxSpacing.xy(16, 6),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: FxTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                children: [
                  FxContainer.bordered(
                    onTap: () {
                      controller.toggleSelect();
                    },
                    borderRadiusAll: 4,
                    border: Border.all(
                        color: controller.selected
                            ? customTheme.muviPrimary
                            : theme.dividerColor),
                    paddingAll: controller.selected ? 0 : 8,
                    color: controller.selected
                        ? customTheme.muviPrimary
                        : customTheme.card.withAlpha(120),
                    child: controller.selected
                        ? Icon(
                            FeatherIcons.check,
                            size: 16,
                            color: customTheme.muviOnPrimary,
                          )
                        : Container(),
                  ),
                  FxSpacing.width(12),
                  FxText.bodySmall(
                    'Sign in automatically on each visit',
                    xMuted: true,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Container(
              margin: FxSpacing.x(20),
              alignment: Alignment.centerRight,
              child: FxButton.text(
                splashColor: customTheme.muviPrimary.withAlpha(30),
                onPressed: () {
                  controller.goToLoginScreen();
                },
                padding: FxSpacing.x(10),
                child: FxText.bodySmall(
                  'Already have account? ',
                  color: customTheme.muviPrimary,
                ),
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(30),
              child: FxButton.small(
                onPressed: () {
                  controller.signIn();
                },
                backgroundColor: customTheme.muviPrimary,
                splashColor: customTheme.muviOnPrimary.withAlpha(30),
                elevation: 0,
                padding: FxSpacing.y(12),
                borderRadiusAll: 4,
                child: FxText.bodyMedium(
                  'Register',
                  fontWeight: 600,
                  color: customTheme.muviOnPrimary,
                ),
              ),
            ),
            FxSpacing.height(20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    'Forgot the magic word?',
                    xMuted: true,
                  ),
                  FxSpacing.width(8),
                  FxButton.text(
                    onPressed: () {
                      controller.goToForgotPasswordScreen();
                    },
                    padding: FxSpacing.zero,
                    splashColor: customTheme.muviPrimary.withAlpha(30),
                    child: FxText.bodySmall(
                      'Forgot Password',
                      fontWeight: 700,
                      color: customTheme.muviPrimary,
                      muted: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
