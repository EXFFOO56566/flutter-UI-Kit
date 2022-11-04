import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.top(150),
        children: [
          Image(
            height: 64,
            image: AssetImage('assets/images/apps/muvi/lock.png'),
          ),
          FxSpacing.height(12),
          FxText.bodyLarge(
            'Forgot Password',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(4),
          FxText.labelMedium(
            'Enter your email address below and we will send\n you further instructions on how to reset your password.',
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
                  labelText: 'Email',
                  isCollapsed: true,
                  scrollPadding: EdgeInsets.zero,
                  contentPadding: FxSpacing.xy(16, 6),
                  isDense: true,
                  textColor: theme.colorScheme.onBackground,
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
            child: FxButton.small(
              onPressed: () {
                controller.forgotPassword();
              },
              padding: FxSpacing.y(12),
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              elevation: 0,
              borderRadiusAll: 4,
              child: FxText.bodyMedium(
                'Submit',
                fontWeight: 600,
                color: customTheme.muviOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
