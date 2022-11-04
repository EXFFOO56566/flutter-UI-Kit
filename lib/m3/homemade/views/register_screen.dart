import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../theme/constant.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
    registerController = FxControllerStore.putOrFind(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: registerController,
        builder: (registerController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.displaySmall(
                  'Hey !\nSignup to get started',
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                ),
                FxSpacing.height(60),
                Padding(
                  padding: FxSpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.name,
                        filled: true,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                        focusedBorderRadius: Constant.containerRadius.large,
                        enabledBorderRadius: Constant.containerRadius.large,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.email,
                        filled: true,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                        focusedBorderRadius: Constant.containerRadius.large,
                        enabledBorderRadius: Constant.containerRadius.large,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.password,
                        suffixIconColor: theme.colorScheme.primary,
                        filled: true,
                        fillColor: theme.colorScheme.primaryContainer,
                        enabledBorderColor: theme.colorScheme.primary,
                        focusedBorderColor: theme.colorScheme.primary,
                        prefixIconColor: theme.colorScheme.primary,
                        labelTextColor: theme.colorScheme.primary,
                        cursorColor: theme.colorScheme.primary,
                        focusedBorderRadius: Constant.containerRadius.large,
                        enabledBorderRadius: Constant.containerRadius.large,
                      ),
                      FxSpacing.height(32),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: Constant.buttonRadius.large,
                        onPressed: () {
                          registerController.register();
                        },
                        backgroundColor: theme.colorScheme.primary,
                        child: FxText.titleMedium(
                          "REGISTER",
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            registerController.goToLogin();
                          },
                          splashColor: theme.colorScheme.primaryContainer,
                          child: FxText.bodySmall("I already have an account",
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
