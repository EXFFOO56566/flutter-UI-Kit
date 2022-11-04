import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
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
  late ForgotPasswordController forgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
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
                  color: theme.colorScheme.primary,
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
                        enabledBorderRadius: Constant.buttonRadius.large,
                        focusedBorderRadius: Constant.buttonRadius.large,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                      ),
                      FxSpacing.height(24),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: Constant.buttonRadius.large,
                        onPressed: () {
                          forgotPasswordController.forgotPassword();
                        },
                        backgroundColor: theme.colorScheme.primary,
                        child: FxText.titleMedium(
                          "Forgot Password",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            forgotPasswordController.goToRegister();
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
