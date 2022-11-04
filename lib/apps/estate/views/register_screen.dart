import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/register_controller.dart';
import 'full_app_screen.dart';
import 'login_screen.dart';

class EstateRegisterScreen extends StatefulWidget {
  const EstateRegisterScreen({Key? key}) : super(key: key);

  @override
  _EstateRegisterScreenState createState() => _EstateRegisterScreenState();
}

class _EstateRegisterScreenState extends State<EstateRegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateRegisterController estateRegisterController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateRegisterController =
        FxControllerStore.putOrFind(EstateRegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateRegisterController>(
        controller: estateRegisterController,
        builder: (estateRegisterController) {
          return Scaffold(
            body: FxContainer(
              color: customTheme.estatePrimary.withAlpha(224),
              marginAll: 0,
              paddingAll: 0,
              child: FxContainer(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                width: MediaQuery.of(context).size.width,
                margin: FxSpacing.top(220),
                child: ListView(
                  children: [
                    FxText.headlineMedium(
                      'Register',
                      color: customTheme.estatePrimary,
                      fontWeight: 700,
                    ),
                    FxSpacing.height(24),
                    Padding(
                      padding: FxSpacing.horizontal(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.bodyLarge(
                            'Name',
                            fontWeight: 600,
                          ),
                          FxTextField(
                            textFieldType: FxTextFieldType.name,
                            textFieldStyle: FxTextFieldStyle.underlined,
                            autoIcon: false,
                            filled: false,
                            labelText: "Your name",
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            controller: estateRegisterController.nameController,
                            focusedBorderColor: customTheme.estatePrimary,
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(16),
                          FxText.bodyLarge(
                            'Email',
                            fontWeight: 600,
                          ),
                          FxTextField(
                            textFieldType: FxTextFieldType.email,
                            textFieldStyle: FxTextFieldStyle.underlined,
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            autoIcon: false,
                            filled: false,
                            labelText: "Your email id",
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            controller:
                                estateRegisterController.emailController,
                            focusedBorderColor: customTheme.estatePrimary,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(16),
                          FxText.bodyLarge(
                            'Password',
                            fontWeight: 600,
                          ),
                          FxTextField(
                            maxLines: 1,
                            textFieldType: FxTextFieldType.password,
                            textFieldStyle: FxTextFieldStyle.underlined,
                            enabledBorderColor:
                                theme.colorScheme.onBackground.withAlpha(160),
                            allowSuffixIcon: true,
                            autoIcon: true,
                            filled: false,
                            labelText: "Password",
                            contentPadding: FxSpacing.fromLTRB(0, 8, 4, 2),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(140),
                            ),
                            isCollapsed: true,
                            controller:
                                estateRegisterController.passwordController,
                            focusedBorderColor: customTheme.estatePrimary,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            cursorColor: customTheme.estatePrimary,
                            suffixIconColor: customTheme.estatePrimary,
                          ),
                          FxSpacing.height(32),
                          FxButton.block(
                            elevation: 0,
                            borderRadiusAll: 8,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EstateFullAppScreen()),
                              );
                            },
                            backgroundColor: customTheme.estatePrimary,
                            child: FxText.titleSmall(
                              "REGISTER",
                              fontWeight: 700,
                              color: customTheme.estateOnPrimary,
                              letterSpacing: 0.4,
                            ),
                          ),
                          FxSpacing.height(16),
                          Center(
                            child: FxButton.text(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateLoginScreen()),
                                );
                              },
                              splashColor:
                                  customTheme.estatePrimary.withAlpha(40),
                              child: FxText.labelMedium(
                                  "I already have an account",
                                  decoration: TextDecoration.underline,
                                  color: customTheme.estatePrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
