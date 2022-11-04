import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'forgot_password_screen.dart';
import 'full_app.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';

class MediCareRegistrationScreen extends StatefulWidget {
  @override
  _MediCareRegistrationScreenState createState() =>
      _MediCareRegistrationScreenState();
}

class _MediCareRegistrationScreenState
    extends State<MediCareRegistrationScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.horizontal(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.name,
              filled: true,
              fillColor: customTheme.medicarePrimary.withAlpha(40),
              enabledBorderColor: customTheme.medicarePrimary,
              focusedBorderColor: customTheme.medicarePrimary,
              prefixIconColor: customTheme.medicarePrimary,
              labelTextColor: customTheme.medicarePrimary,
              cursorColor: customTheme.medicarePrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: customTheme.medicarePrimary.withAlpha(40),
              enabledBorderColor: customTheme.medicarePrimary,
              focusedBorderColor: customTheme.medicarePrimary,
              prefixIconColor: customTheme.medicarePrimary,
              labelTextColor: customTheme.medicarePrimary,
              cursorColor: customTheme.medicarePrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.password,
              filled: true,
              fillColor: customTheme.medicarePrimary.withAlpha(40),
              enabledBorderColor: customTheme.medicarePrimary,
              focusedBorderColor: customTheme.medicarePrimary,
              prefixIconColor: customTheme.medicarePrimary,
              labelTextColor: customTheme.medicarePrimary,
              cursorColor: customTheme.medicarePrimary,
            ),
            FxSpacing.height(16),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  padding: FxSpacing.zero,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => MediCareForgotPasswordScreen()),
                    );
                  },
                  splashColor: customTheme.medicarePrimary.withAlpha(40),
                  child: FxText.bodySmall("Forgot Password?",
                      color: customTheme.medicarePrimary)),
            ),
            FxSpacing.height(16),
            FxButton.block(
                borderRadiusAll: 8,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: customTheme.medicarePrimary,
                child: FxText.bodyLarge(
                  "Create an Account",
                  color: customTheme.medicareOnPrimary,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => MediCareLoginScreen()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: FxText.bodySmall("I have already an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary)),
          ],
        ),
      ),
    );
  }
}
