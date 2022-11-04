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

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ForgotPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ForgotPasswordController());
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
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.displaySmall(
                    'Forgot \nPassword?',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(20),
                  FxText.bodySmall(
                    'Don\'t worry! It happens. Please enter the address associated with your account.',
                  ),
                  FxSpacing.height(20),
                  Form(
                    key: controller.formKey,
                    child: TextFormField(
                      style: FxTextStyle.bodyMedium(),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          isDense: true,
                          fillColor: customTheme.card,
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
                  FxSpacing.height(40),
                  FxButton.block(
                    onPressed: () {
                      controller.goToResetPasswordScreen();
                    },
                    backgroundColor: customTheme.fitnessPrimary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: FxText.bodyMedium(
                      'Submit',
                      color: customTheme.fitnessOnPrimary,
                      fontWeight: 600,
                    ),
                  ),
                  FxSpacing.height(20),
                ],
              ),
            ),
          );
        });
  }
}
