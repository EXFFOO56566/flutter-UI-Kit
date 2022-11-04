import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = FxControllerStore.putOrFind(RegisterController());
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
    return FxBuilder<RegisterController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FxText.titleLarge(
                      "Create an account",
                      fontWeight: 700,
                    ),
                    FxSpacing.height(20),
                    registerForm(),
                    FxSpacing.height(20),
                    registerBtn(),
                    FxSpacing.height(10),
                    loginBtn(),
                    FxSpacing.height(20),
                    Divider(),
                    FxSpacing.height(20),
                    google(),
                    FxSpacing.height(20),
                    facebook(),
                    FxSpacing.height(20),
                    apple()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget registerForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          emailField(),
          FxSpacing.height(20),
          passwordField(),
          FxSpacing.height(20),
          nameField()
        ],
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

  Widget passwordField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Password",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: FxSpacing.all(16),
          hintStyle: FxTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.passwordController,
      validator: controller.validatePassword,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget nameField() {
    return TextFormField(
      style: FxTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          fillColor: theme.cardTheme.color,
          hintText: "Name",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: FxSpacing.all(16),
          hintStyle: FxTextStyle.bodySmall(xMuted: true),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.nameController,
      validator: controller.validateName,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget registerBtn() {
    return FxButton.block(
      onPressed: () {
        controller.register();
      },
      borderRadiusAll: Constant.buttonRadius.xs,
      elevation: 0,
      child: FxText.labelLarge(
        "Create your account",
        fontWeight: 700,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget loginBtn() {
    return FxButton.text(
      onPressed: () {
        controller.goToLoginScreen();
      },
      borderRadiusAll: Constant.buttonRadius.xs,
      child: FxText.bodySmall(
        "Already have an account?",
        fontWeight: 600,
        xMuted: true,
      ),
    );
  }

  Widget google() {
    return FxButton.block(
      elevation: 0,
      padding: FxSpacing.y(12),
      backgroundColor: theme.cardTheme.color,
      borderRadiusAll: Constant.buttonRadius.xs,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage(
              'assets/images/full_apps/nft/icons/google.png',
            ),
          ),
          FxSpacing.width(12),
          FxText.labelLarge(
            "Continue with Google",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }

  Widget facebook() {
    return FxButton.block(
      elevation: 0,
      padding: FxSpacing.y(12),
      backgroundColor: theme.cardTheme.color,
      borderRadiusAll: Constant.buttonRadius.xs,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage('assets/images/full_apps/nft/icons/facebook.png'),
          ),
          FxSpacing.width(12),
          FxText.labelLarge(
            "Continue with Facebook",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }

  Widget apple() {
    return FxButton.block(
      elevation: 0,
      padding: FxSpacing.y(12),
      backgroundColor: theme.cardTheme.color,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 20,
            width: 20,
            color: theme.colorScheme.primary,
            image: AssetImage('assets/images/full_apps/nft/icons/apple.png'),
          ),
          FxSpacing.width(12),
          FxText.labelLarge(
            "Continue with Apple",
            fontWeight: 700,
          ),
        ],
      ),
    );
  }
}
