import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late LogInController logInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
    logInController = FxControllerStore.putOrFind(LogInController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: logInController,
        builder: (logInController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.displaySmall(
                  'Hello !\nWelcome to homemade App',
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                ),
                FxSpacing.height(80),
                Padding(
                  padding: FxSpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.email,
                        filled: true,
                        enabledBorderRadius: Constant.containerRadius.large,
                        focusedBorderRadius: Constant.containerRadius.large,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.password,
                        suffixIconColor: theme.colorScheme.primary,
                        filled: true,
                        enabledBorderRadius: Constant.containerRadius.large,
                        focusedBorderRadius: Constant.containerRadius.large,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                      ),
                      FxSpacing.height(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FxButton.text(
                          onPressed: () {
                            logInController.goToForgotPassword();
                          },
                          padding: FxSpacing.y(4),
                          splashColor: theme.colorScheme.primaryContainer,
                          child: FxText.bodySmall("Forgot Password?",
                              color: theme.colorScheme.primary),
                        ),
                      ),
                      FxSpacing.height(16),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: Constant.buttonRadius.large,
                        onPressed: () {
                          logInController.login();
                        },
                        backgroundColor: theme.colorScheme.primary,
                        splashColor: theme.colorScheme.primaryContainer,
                        child: FxText.bodyMedium(
                          "LOG IN",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            logInController.goToRegister();
                          },
                          splashColor: theme.colorScheme.primaryContainer,
                          child: FxText.bodySmall("I haven\'t an account",
                              decoration: TextDecoration.underline,
                              color: theme.colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
