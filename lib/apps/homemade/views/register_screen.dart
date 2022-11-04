import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
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
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
                  color: customTheme.homemadePrimary,
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
                      FxSpacing.height(32),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () {
                          registerController.register();
                        },
                        backgroundColor: customTheme.homemadePrimary,
                        child: FxText.titleMedium(
                          "REGISTER",
                          fontWeight: 700,
                          color: customTheme.homemadeOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            registerController.goToLogin();
                          },
                          splashColor:
                              customTheme.homemadePrimary.withAlpha(40),
                          child: FxText.bodySmall("I already have an account",
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
