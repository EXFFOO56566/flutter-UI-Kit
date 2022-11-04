import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(LogInController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.x(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.displaySmall(
              'Log In',
              fontWeight: 700,
            ),
            FxSpacing.height(20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: FxTextStyle.bodyMedium(),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          FeatherIcons.mail,
                          color: theme.colorScheme.onBackground,
                        ),
                        hintText: "Email Address",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.bodyMedium(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.emailTE,
                    validator: controller.validateEmail,
                    cursorColor: theme.colorScheme.onBackground,
                  ),
                  FxSpacing.height(20),
                  TextFormField(
                    style: FxTextStyle.bodyMedium(),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          FeatherIcons.lock,
                          color: theme.colorScheme.onBackground,
                        ),
                        hintText: "Password",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.bodyMedium(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.passwordTE,
                    validator: controller.validatePassword,
                    cursorColor: theme.colorScheme.onBackground,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  onPressed: () {
                    controller.goToForgotPasswordScreen();
                  },
                  padding: FxSpacing.zero,
                  splashColor: customTheme.fitnessPrimary.withAlpha(40),
                  child: FxText.bodySmall(
                    'Forgot password ?',
                    color: customTheme.fitnessPrimary,
                  )),
            ),
            FxSpacing.height(20),
            Row(
              children: [
                FxButton(
                    padding: FxSpacing.xy(16, 12),
                    onPressed: () {
                      controller.login();
                    },
                    backgroundColor: customTheme.card,
                    splashColor: theme.colorScheme.onBackground.withAlpha(40),
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(Images.google),
                          height: 17,
                          width: 17,
                        ),
                        FxSpacing.width(20),
                        FxText.labelMedium(
                          'Login with Google',
                          fontWeight: 600,
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    )),
                FxSpacing.width(20),
                Expanded(
                  child: FxButton(
                    padding: FxSpacing.y(12),
                    onPressed: () {
                      controller.login();
                    },
                    backgroundColor: customTheme.fitnessPrimary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: FxText.bodyMedium(
                      'Log In',
                      color: customTheme.fitnessOnPrimary,
                      fontWeight: 600,
                    ),
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.bodySmall(
                  'New to fitness? ',
                ),
                FxButton.text(
                    onPressed: () {
                      controller.goToRegisterScreen();
                    },
                    padding: FxSpacing.zero,
                    splashColor: customTheme.fitnessPrimary.withAlpha(40),
                    child: FxText.bodySmall(
                      'Register',
                      color: customTheme.fitnessPrimary,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
