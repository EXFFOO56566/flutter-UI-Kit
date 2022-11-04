import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import 'full_app.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';

class MediCareForgotPasswordScreen extends StatefulWidget {
  @override
  _MediCareForgotPasswordScreenState createState() =>
      _MediCareForgotPasswordScreenState();
}

class _MediCareForgotPasswordScreenState
    extends State<MediCareForgotPasswordScreen> {
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
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: customTheme.medicarePrimary.withAlpha(40),
              enabledBorderColor: customTheme.medicarePrimary,
              focusedBorderColor: customTheme.medicarePrimary,
              prefixIconColor: customTheme.medicarePrimary,
              labelTextColor: customTheme.medicarePrimary,
              cursorColor: customTheme.medicarePrimary,
            ),
            FxSpacing.height(32),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: customTheme.medicarePrimary,
                child: FxText.bodyLarge(
                  "Forgot Password",
                  color: customTheme.medicareOnPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3,
                )),
            FxSpacing.height(16),
            FxButton.text(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => MediCareRegistrationScreen()),
                  );
                },
                splashColor: customTheme.medicarePrimary.withAlpha(40),
                child: FxText.bodySmall("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: customTheme.medicarePrimary))
          ],
        ),
      ),
    );
  }
}
