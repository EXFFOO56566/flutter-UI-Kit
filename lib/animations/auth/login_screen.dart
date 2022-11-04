import 'package:flare_flutter/flare_actor.dart';
import 'package:flutkit/animations/auth/tracking_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;

    controller = FxControllerStore.putOrFind(LogInController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 64, 20, 20),
              children: [
                Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlareActor(
                      "assets/animations/rive/teddy.flr",
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: controller.teddyController,
                    )),
                Form(
                  key: controller.formKey,
                  child: FxContainer.bordered(
                    color: theme.colorScheme.background,
                    child: Column(
                      children: [
                        FxText.headlineSmall(
                          'Hello Again!',
                          fontWeight: 700,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(20),
                        TrackingTextInput(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
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
                          controller: controller.emailTE,
                          validator: controller.validateEmail,
                          cursorColor: theme.colorScheme.onBackground,
                          focusNode: controller.emailNode,
                          onCaretMoved: (offset) {
                            controller.onCaretMoved(offset);
                          },
                        ),
                        FxSpacing.height(20),
                        TrackingTextInput(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: theme.cardTheme.color,
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
                          controller: controller.passwordTE,
                          focusNode: controller.passwordNode,
                          validator: controller.validatePassword,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        FxSpacing.height(20),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () {
                            controller.login();
                          },
                          splashColor:
                              theme.colorScheme.onPrimary.withAlpha(28),
                          backgroundColor: theme.colorScheme.primary,
                          child: FxText.labelMedium(
                            "Sign In",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
