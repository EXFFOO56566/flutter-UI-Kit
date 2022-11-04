import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;

  late ForgotPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = FxControllerStore.put(ForgotPasswordController(this));
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 48, 20, 20),
        children: [
          FxText.displaySmall(
            'Forgot Password?',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          FxText.bodyMedium(
            'Welcome to change password!!',
            muted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),
          Form(
            key: controller.formKey,
            child: SlideTransition(
              position: controller.emailAnimation,
              child: TextFormField(
                style: FxTextStyle.bodyMedium(),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
          ),
          FxSpacing.height(20),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              controller.goToResetPasswordScreen();
            },
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: theme.colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.labelLarge(
                  "Submit",
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
          FxSpacing.height(16),
          Center(
            child: FxButton.text(
              onPressed: () {
                controller.goToRegisterScreen();
              },
              splashColor: theme.colorScheme.primary.withAlpha(40),
              child: FxText.labelLarge("I haven\'t an account",
                  decoration: TextDecoration.underline,
                  color: theme.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
