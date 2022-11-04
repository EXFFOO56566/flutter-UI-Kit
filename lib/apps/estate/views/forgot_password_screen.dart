import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/forgot_password_controller.dart';
import 'full_app_screen.dart';
import 'register_screen.dart';

class EstateForgotPasswordScreen extends StatefulWidget {
  const EstateForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _EstateForgotPasswordScreenState createState() =>
      _EstateForgotPasswordScreenState();
}

class _EstateForgotPasswordScreenState
    extends State<EstateForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateForgotPasswordController estateForgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateForgotPasswordController =
        FxControllerStore.putOrFind(EstateForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateForgotPasswordController>(
        controller: estateForgotPasswordController,
        builder: (estateForgotPasswordController) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: FxContainer(
              color: customTheme.estatePrimary.withAlpha(220),
              marginAll: 0,
              paddingAll: 0,
              child: FxContainer(
                paddingAll: 24,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                width: MediaQuery.of(context).size.width,
                margin: FxSpacing.top(220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.displaySmall(
                      'Forgot Password?',
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
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            controller:
                                estateForgotPasswordController.emailController,
                            focusedBorderColor: customTheme.estatePrimary,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(32),
                          FxButton.block(
                            elevation: 0,
                            borderRadiusAll: 8,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EstateFullAppScreen()),
                              );
                            },
                            backgroundColor: customTheme.estatePrimary,
                            child: FxText.labelLarge(
                              "Forgot Password",
                              fontWeight: 700,
                              color: customTheme.estateOnPrimary,
                              letterSpacing: 0.4,
                            ),
                          ),
                          FxSpacing.height(16),
                          Center(
                            child: FxButton.text(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateRegisterScreen()),
                                );
                              },
                              splashColor:
                                  customTheme.estatePrimary.withAlpha(40),
                              child: FxText.bodySmall("I haven\'t an account",
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
