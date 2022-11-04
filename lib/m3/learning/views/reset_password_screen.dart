import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../../../theme/constant.dart';
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
    theme = AppTheme.learningTheme;
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
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 40, 20, 20),
        children: [
          FxText.displaySmall(
            'Reset \nPassword',
            fontWeight: 700,
            color: theme.colorScheme.primary,
          ),
          FxSpacing.height(24),
          Center(
            child: Image(
              image: AssetImage(Images.forgotPassword),
              color: theme.colorScheme.primary,
              width: 72,
              height: 72,
            ),
          ),
          FxSpacing.height(40),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style: FxTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
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
                FxSpacing.height(20),
                TextFormField(
                  style: FxTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.colorScheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.onBackground,
                      ),
                      hintText: "Confirm Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.confirmPasswordTE,
                  validator: controller.validateConfirmPassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: Constant.buttonRadius.large,
            onPressed: () {
              controller.resetPassword();
            },
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: theme.colorScheme.primary,
            child: FxText.labelLarge(
              "Reset Password",
              color: theme.colorScheme.onPrimary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
