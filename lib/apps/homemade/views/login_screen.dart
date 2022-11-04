import 'package:flutkit/theme/app_theme.dart';
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
  late CustomTheme customTheme;
  late LogInController logInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
                  color: customTheme.homemadePrimary,
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
                        fillColor: customTheme.homemadePrimary.withAlpha(50),
                        enabledBorderColor: customTheme.homemadePrimary,
                        focusedBorderColor: customTheme.homemadePrimary,
                        prefixIconColor: customTheme.homemadePrimary,
                        labelTextColor: customTheme.homemadePrimary,
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.password,
                        suffixIconColor: customTheme.homemadePrimary,
                        filled: true,
                        fillColor: customTheme.homemadePrimary.withAlpha(50),
                        enabledBorderColor: customTheme.homemadePrimary,
                        focusedBorderColor: customTheme.homemadePrimary,
                        prefixIconColor: customTheme.homemadePrimary,
                        labelTextColor: customTheme.homemadePrimary,
                        cursorColor: customTheme.homemadePrimary,
                      ),
                      FxSpacing.height(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FxButton.text(
                            onPressed: () {
                              logInController.goToForgotPassword();
                            },
                            padding: FxSpacing.y(4),
                            splashColor:
                                customTheme.homemadePrimary.withAlpha(40),
                            child: FxText.bodySmall("Forgot Password?",
                                color: customTheme.homemadePrimary)),
                      ),
                      FxSpacing.height(16),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          logInController.login();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: FxText.bodyMedium(
                          "LOG IN",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            logInController.goToRegister();
                          },
                          splashColor:
                              customTheme.homemadePrimary.withAlpha(40),
                          child: FxText.bodySmall("I haven\'t an account",
                              decoration: TextDecoration.underline,
                              color: customTheme.homemadePrimary),
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
