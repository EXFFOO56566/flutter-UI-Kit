import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ResetPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(ResetPasswordController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
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
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.displaySmall(
                    'Reset \nPassword',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
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
                  FxSpacing.height(40),
                  FxButton.block(
                    onPressed: () {
                      controller.resetPassword();
                    },
                    backgroundColor: customTheme.fitnessPrimary,
                    splashColor: customTheme.fitnessOnPrimary.withAlpha(40),
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
