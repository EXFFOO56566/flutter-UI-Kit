/*
* File : Login & Register
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  bool _passwordVisible = false;
  PageController? _pageController;
  late ThemeData themeData;
  int _selectedIndex = 0;
  Color left = Colors.black;
  Color right = Colors.white;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: themeData.backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: themeData.backgroundColor,
                alignment: Alignment.centerLeft,
                margin: FxSpacing.x(20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    if (i == 0) {
                      setState(() {
                        _selectedIndex = 0;
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        _selectedIndex = 1;
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: _buildSignIn(context),
                      ),
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: _buildSignUp(context),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: FxTabIndicationPainter(
            pageController: _pageController,
            selectedBackground: themeData.colorScheme.primary,
            indicatorWidth: 125,
            xPadding: 25,
            indicatorRadius: 20,
            yPadding: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FxButton(
                onPressed: _onSignInButtonPress,
                backgroundColor: Colors.transparent,
                child: FxText.titleMedium("Login",
                    fontWeight: _selectedIndex == 0 ? 700 : 600,
                    color: _selectedIndex == 0
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FxButton(
                elevation: 0,
                padding: FxSpacing.x(0),
                onPressed: _onSignUpButtonPress,
                backgroundColor: Colors.transparent,
                child: FxText.titleMedium("Register",
                    fontWeight: _selectedIndex == 1 ? 700 : 600,
                    color: _selectedIndex == 1
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            FxContainer.bordered(
              color: Colors.transparent,
              margin: FxSpacing.x(20),
              padding:
                  EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 32),
              child: Container(
                width: 340.0,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        prefixIcon: Icon(MdiIcons.emailOutline),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: TextFormField(
                        style: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground),
                          prefixIcon: Icon(MdiIcons.lockOutline),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = _passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: _passwordVisible,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      alignment: Alignment.centerRight,
                      child: FxText.bodySmall("Forgot Password ?",
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: FxButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {},
                  child: FxText.labelMedium("LOGIN",
                      fontWeight: 600,
                      color: themeData.colorScheme.onPrimary,
                      letterSpacing: 0.5)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            FxContainer.bordered(
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 36),
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: FxTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      prefixIcon: Icon(MdiIcons.accountOutline),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: FxTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(MdiIcons.emailOutline),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Number",
                        hintStyle: FxTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(MdiIcons.phoneOutline),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: FxTextStyle.bodyLarge(
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = _passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordVisible,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: FxButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {},
                  child: FxText.labelMedium("REGISTER",
                      fontWeight: 600,
                      color: themeData.colorScheme.onPrimary,
                      letterSpacing: 0.5)),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController!.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
