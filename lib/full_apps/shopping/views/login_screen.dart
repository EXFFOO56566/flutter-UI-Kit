import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = FxControllerStore.put(LogInController(this));
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 64, 20, 20),
              children: [
                FxText.displaySmall(
                  'Hello Again!',
                  fontWeight: 700,
                  textAlign: TextAlign.center,
                ),
                FxSpacing.height(20),
                FxText.bodyMedium(
                  'Welcome back you\'ve been missed!',
                  muted: true,
                  textAlign: TextAlign.center,
                ),
                FxSpacing.height(32),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SlideTransition(
                        position: controller.emailAnimation,
                        child: TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                FeatherIcons.mail,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Email Address",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.emailTE,
                          validator: controller.validateEmail,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                      ),
                      FxSpacing.height(20),
                      SlideTransition(
                        position: controller.passwordAnimation,
                        child: TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
                              prefixIcon: Icon(
                                FeatherIcons.lock,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Password",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.passwordTE,
                          validator: controller.validatePassword,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: FxButton.text(
                    onPressed: () {
                      controller.goToForgotPasswordScreen();
                    },
                    padding: FxSpacing.zero,
                    splashColor: theme.colorScheme.primary.withAlpha(40),
                    child: Text(
                      "Forgot Password ?",
                      style: FxTextStyle.bodySmall(
                          color: theme.colorScheme.primary),
                    ),
                  ),
                ),
                FxSpacing.height(20),
                FxButton.block(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    controller.login();
                  },
                  splashColor: theme.colorScheme.onPrimary.withAlpha(28),
                  backgroundColor: theme.colorScheme.primary,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FxText.labelLarge(
                          "Sign In",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                        FxSpacing.width(8),
                        SlideTransition(
                            position: controller.arrowAnimation,
                            child: Icon(
                              FeatherIcons.arrowRight,
                              color: theme.colorScheme.onPrimary,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
                FxSpacing.height(20),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: FxSpacing.x(16),
                      child: FxText.bodySmall(
                        'Continue with',
                        muted: true,
                        fontSize: 10,
                        fontWeight: 600,
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                FxSpacing.height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FxContainer.bordered(
                      padding: FxSpacing.all(16),
                      borderRadiusAll: 4,
                      child: Image(
                        height: 20,
                        width: 20,
                        image: AssetImage(Images.google),
                      ),
                    ),
                    FxContainer.bordered(
                      padding: FxSpacing.all(16),
                      borderRadiusAll: 4,
                      child: Image(
                        height: 20,
                        width: 20,
                        image: AssetImage(Images.apple),
                      ),
                    ),
                    FxContainer.bordered(
                      padding: FxSpacing.all(16),
                      borderRadiusAll: 4,
                      child: Image(
                        height: 20,
                        width: 20,
                        image: AssetImage(Images.facebook),
                      ),
                    ),
                  ],
                ),
                FxSpacing.height(20),
                Center(
                  child: FxButton.text(
                      padding: FxSpacing.zero,
                      onPressed: () {
                        controller.goToRegisterScreen();
                      },
                      child: FxText.labelLarge("Create an Account",
                          decoration: TextDecoration.underline,
                          color: theme.colorScheme.primary)),
                ),
              ],
            ),
          );
        });
  }
}
