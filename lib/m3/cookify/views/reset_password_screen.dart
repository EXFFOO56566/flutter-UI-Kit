import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ThemeData theme;

  late ResetPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;

    controller = FxControllerStore.putOrFind(ResetPasswordController());
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
    return FxBuilder<ResetPasswordController>(
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
            child: Column(
              children: [
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(FeatherIcons.lock,
                          color: theme.colorScheme.primary),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.passwordTE,
                  validator: controller.validatePassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style:
                      FxTextStyle.bodyMedium(color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Confirm Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(
                          color: theme.colorScheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.confirmPasswordTE,
                  validator: controller.validateConfirmPassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          FxSpacing.height(32),
          FxButton.block(
              borderRadiusAll: Constant.buttonRadius.large,
              onPressed: () {
                controller.resetPassword();
              },
              elevation: 0,
              backgroundColor: theme.colorScheme.primary,
              child: FxText.labelLarge(
                "Reset Password",
                color: theme.colorScheme.onPrimary,
              )),
        ],
      ),
    );
  }
}
