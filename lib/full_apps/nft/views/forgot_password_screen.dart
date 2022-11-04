import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(ForgotPasswordController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.containerRadius.xs)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 40, 20, 0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      FxText.titleLarge(
                        "Enter email to get link",
                        fontWeight: 700,
                      ),
                      FxSpacing.height(40),
                      forgotPasswordForm(),
                      FxSpacing.height(20),
                      forgotPasswordBtn(),
                      FxSpacing.height(20),
                      registerBtn()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget forgotPasswordForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [emailField()],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Email Address",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: FxSpacing.all(16),
          hintStyle: FxTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.emailController,
      validator: controller.validateEmail,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget forgotPasswordBtn() {
    return FxButton.block(
      onPressed: () {
        controller.forgotPassword();
      },
      elevation: 0,
      borderRadiusAll: Constant.textFieldRadius.xs,
      child: FxText.labelLarge(
        "Submit",
        fontWeight: 700,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget registerBtn() {
    return FxButton.text(
      onPressed: () {
        controller.goToRegisterScreen();
      },
      child: FxText.bodySmall(
        "Don\'t have an account?",
        fontWeight: 600,
        xMuted: true,
      ),
    );
  }
}
