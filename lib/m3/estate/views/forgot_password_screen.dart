import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              body: FxContainer(
                color: theme.colorScheme.primary,
                marginAll: 0,
                paddingAll: 0,
                child: FxContainer(
                  paddingAll: 24,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Constant.containerRadius.large),
                      topLeft: Radius.circular(Constant.containerRadius.large)),
                  width: MediaQuery.of(context).size.width,
                  margin: FxSpacing.top(220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.displaySmall(
                        'Forgot Password?',
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
                            FxSpacing.height(32),
                            FxButton.block(
                              elevation: 0,
                              borderRadiusAll: Constant.buttonRadius.large,
                              onPressed: () {
                                controller.goToHome();
                              },
                              backgroundColor: theme.colorScheme.primary,
                              child: FxText.labelLarge(
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
                                  controller.goToRegisterScreen();
                                },
                                splashColor:
                                    theme.colorScheme.primary.withAlpha(40),
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
                ),
              ),
            ),
          );
        });
  }
}
