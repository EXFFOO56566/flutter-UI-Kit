import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';
import 'forgot_password_screen.dart';
import 'full_app.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';

class MediCareLoginScreen extends StatefulWidget {
  @override
  _MediCareLoginScreenState createState() => _MediCareLoginScreenState();
}

class _MediCareLoginScreenState extends State<MediCareLoginScreen> {
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
      body: Center(
        child: Padding(
          padding: FxSpacing.horizontal(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.email,
                filled: true,
                fillColor: customTheme.medicarePrimary.withAlpha(50),
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
                fillColor: customTheme.medicarePrimary.withAlpha(50),
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
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                MediCareForgotPasswordScreen()),
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
                child: FxText.labelMedium(
                  "LOG IN",
                  fontWeight: 700,
                  color: customTheme.medicareOnPrimary,
                  letterSpacing: 0.4,
                ),
              ),
              FxSpacing.height(16),
              FxButton.text(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => MediCareRegistrationScreen()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: FxText.bodySmall("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
