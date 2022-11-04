import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = FxControllerStore.putOrFind(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: FxContainer(
                color: theme.colorScheme.primary,
                marginAll: 0,
                paddingAll: 0,
                child: FxContainer(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Constant.containerRadius.large),
                      topLeft: Radius.circular(Constant.containerRadius.large)),
                  width: MediaQuery.of(context).size.width,
                  margin: FxSpacing.top(220),
                  child: ListView(
                    children: [
                      FxText.displayLarge(
                        'Register',
                        color: theme.colorScheme.primary,
                        fontWeight: 700,
                      ),
                      FxSpacing.height(24),
                      Padding(
                        padding: FxSpacing.horizontal(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.bodyLarge(
                              'Name',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.name,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              autoIcon: false,
                              filled: false,
                              labelText: "Your name",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.nameController,
                              focusedBorderColor: theme.colorScheme.primary,
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: theme.colorScheme.primary,
                            ),
                            FxSpacing.height(16),
                            FxText.bodyLarge(
                              'Email',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.email,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              autoIcon: false,
                              filled: false,
                              labelText: "Your email id",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.emailController,
                              focusedBorderColor: theme.colorScheme.primary,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: theme.colorScheme.primary,
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
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              allowSuffixIcon: true,
                              autoIcon: true,
                              filled: false,
                              labelText: "Password",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 2),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.passwordController,
                              focusedBorderColor: theme.colorScheme.primary,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: theme.colorScheme.primary,
                              suffixIconColor: theme.colorScheme.primary,
                            ),
                            FxSpacing.height(32),
                            FxButton.block(
                              elevation: 0,
                              borderRadiusAll: Constant.buttonRadius.large,
                              onPressed: () {
                                controller.goToHomeScreen();
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
                                  controller.goToLoginScreen();
                                },
                                splashColor:
                                    theme.colorScheme.primary.withAlpha(40),
                                child: FxText.bodySmall(
                                    "I already have an account",
                                    decoration: TextDecoration.underline,
                                    color: theme.colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
