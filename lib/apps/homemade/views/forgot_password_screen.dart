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
  late ForgotPasswordController forgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    forgotPasswordController =
        FxControllerStore.putOrFind(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: forgotPasswordController,
        builder: (forgotPasswordController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.displaySmall(
                  'Oops! \nForgot Password?',
                  color: customTheme.homemadePrimary,
                  fontWeight: 700,
                ),
                FxSpacing.height(150),
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
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          forgotPasswordController.forgotPassword();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: FxText.titleMedium(
                          "Forgot Password",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            forgotPasswordController.goToRegister();
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
