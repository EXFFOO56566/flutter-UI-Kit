import 'package:flutkit/m3/cookify/controllers/forgot_password_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late ForgotPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.textFieldRadius.medium)),
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
        padding: FxSpacing.fromLTRB(24, 200, 24, 0),
        children: [
          FxTwoToneIcon(
            FxTwoToneMdiIcons.menu_book,
            color: theme.colorScheme.primary,
            size: 64,
          ),
          FxSpacing.height(16),
          FxText.displaySmall(
            "Forgot Password",
            color: theme.colorScheme.primary,
            fontWeight: 800,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),
          Form(
            key: controller.formKey,
            child: TextFormField(
              style: FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  isDense: true,
                  fillColor: theme.colorScheme.primaryContainer,
                  prefixIcon: Icon(
                    FeatherIcons.mail,
                    color: theme.colorScheme.primary,
                  ),
                  hintText: "Email Address",
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  border: outlineInputBorder,
                  contentPadding: FxSpacing.all(16),
                  hintStyle:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  isCollapsed: true),
              maxLines: 1,
              controller: controller.emailTE,
              validator: controller.validateEmail,
              cursorColor: theme.colorScheme.onBackground,
            ),
          ),
          FxSpacing.height(32),
          FxButton.block(
              borderRadiusAll: Constant.buttonRadius.large,
              onPressed: () {
                controller.forgotPassword();
              },
              elevation: 0,
              backgroundColor: theme.colorScheme.primary,
              child: FxText.labelLarge(
                "Forgot Password",
                color: theme.colorScheme.onPrimary,
              )),
          FxSpacing.height(16),
          FxButton.text(
            onPressed: () {
              controller.goToRegisterScreen();
            },
            splashColor: theme.colorScheme.primaryContainer,
            child: FxText.bodySmall("I haven\'t an account",
                decoration: TextDecoration.underline,
                color: theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
