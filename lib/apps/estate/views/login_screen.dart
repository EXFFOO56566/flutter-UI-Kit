import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/login_controller.dart';
import 'forgot_password_screen.dart';
import 'full_app_screen.dart';
import 'register_screen.dart';

class EstateLoginScreen extends StatefulWidget {
  const EstateLoginScreen({Key? key}) : super(key: key);

  @override
  _EstateLoginScreenState createState() => _EstateLoginScreenState();
}

class _EstateLoginScreenState extends State<EstateLoginScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateLogInController estateLogInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateLogInController =
        FxControllerStore.putOrFind(EstateLogInController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateLogInController>(
        controller: estateLogInController,
        builder: (estateLogInController) {
          return Scaffold(
            body: FxContainer(
              color: customTheme.estatePrimary.withAlpha(224),
              marginAll: 0,
              paddingAll: 0,
              child: FxContainer(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                width: MediaQuery.of(context).size.width,
                margin: FxSpacing.top(220),
                child: ListView(
                  children: [
                    FxText.headlineMedium(
                      'Log In',
                      color: customTheme.estatePrimary,
                      fontWeight: 700,
                    ),
                    FxSpacing.height(24),
                    Padding(
                      padding: FxSpacing.horizontal(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyLarge(
                            'Email',
                            fontWeight: 600,
                          ),
                          FxTextField(
                            textFieldType: FxTextFieldType.email,
                            textFieldStyle: FxTextFieldStyle.underlined,
                            autoIcon: false,
                            filled: false,
                            labelText: "Your email id",
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            controller: estateLogInController.emailController,
                            focusedBorderColor: customTheme.estatePrimary,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(16),
                          FxText.bodyLarge(
                            'Password',
                            fontWeight: 600,
                          ),
                          FxTextField(
                            maxLines: 1,
                            textFieldType: FxTextFieldType.password,
                            textFieldStyle: FxTextFieldStyle.underlined,
                            autoIcon: true,
                            filled: false,
                            labelText: "Password",
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 2),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            allowSuffixIcon: true,
                            controller:
                                estateLogInController.passwordController,
                            focusedBorderColor: customTheme.estatePrimary,
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                            suffixIconColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FxButton.text(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EstateForgotPasswordScreen()),
                                  );
                                },
                                splashColor:
                                    customTheme.estatePrimary.withAlpha(40),
                                child: FxText.bodySmall("Forgot Password?",
                                    color: customTheme.estatePrimary)),
                          ),
                          FxSpacing.height(16),
                          FxButton.block(
                            elevation: 0,
                            borderRadiusAll: 8,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EstateFullAppScreen()),
                              );
                            },
                            backgroundColor: customTheme.estatePrimary,
                            child: FxText.titleSmall(
                              "LOG IN",
                              fontWeight: 700,
                              color: customTheme.estateOnPrimary,
                              letterSpacing: 0.4,
                            ),
                          ),
                          FxSpacing.height(16),
                          Center(
                            child: FxButton.text(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateRegisterScreen()),
                                );
                              },
                              splashColor:
                                  customTheme.estatePrimary.withAlpha(40),
                              child: FxText.labelMedium("I haven\'t an account",
                                  decoration: TextDecoration.underline,
                                  color: customTheme.estatePrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
