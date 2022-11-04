import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(LoginController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LoginController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.top(120),
        children: [
          Image(
            height: 80,
            image: AssetImage('assets/images/apps/muvi/profile.png'),
          ),
          FxSpacing.height(12),
          FxText.bodyLarge(
            'Log In',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(4),
          FxText.labelMedium(
            'Enter your credentials to login yourself.',
            xMuted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          Divider(),
          FxSpacing.height(20),
          FxContainer.bordered(
            borderRadiusAll: 4,
            margin: FxSpacing.x(20),
            padding: FxSpacing.y(6),
            child: Column(
              children: [
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
                  textColor: theme.colorScheme.onBackground,
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
          Container(
            margin: FxSpacing.x(20),
            alignment: Alignment.centerRight,
            child: FxButton.text(
              padding: FxSpacing.x(10),
              splashColor: customTheme.muviPrimary.withAlpha(30),
              onPressed: () {
                controller.goToRegisterScreen();
              },
              child: FxText.bodySmall(
                'Don\'t have an account? ',
                color: customTheme.muviPrimary,
              ),
            ),
          ),
          FxSpacing.height(20),
          Padding(
            padding: FxSpacing.x(30),
            child: FxButton.small(
              onPressed: () {
                controller.logIn();
              },
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              elevation: 0,
              borderRadiusAll: 4,
              padding: FxSpacing.y(12),
              child: FxText.bodyMedium(
                'Log In',
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
    );
  }
}
