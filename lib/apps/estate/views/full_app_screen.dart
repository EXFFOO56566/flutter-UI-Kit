import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class EstateFullAppScreen extends StatefulWidget {
  const EstateFullAppScreen({Key? key}) : super(key: key);

  @override
  _EstateFullAppScreenState createState() => _EstateFullAppScreenState();
}

class _EstateFullAppScreenState extends State<EstateFullAppScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FxBottomNavigationBar(
        activeTitleColor: customTheme.estatePrimary,
        activeContainerColor: customTheme.estatePrimary.withAlpha(50),
        fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
        containerShape: BoxShape.circle,
        showActiveLabel: false,
        showLabel: false,
        activeIconColor: customTheme.estatePrimary,
        iconColor: theme.colorScheme.onBackground.withAlpha(140),
        itemList: [
          FxBottomNavigationBarItem(
            page: EstateHomeScreen(),
            activeIconData: Icons.other_houses,
            iconData: Icons.other_houses_outlined,
            activeIconSize: 24,
            iconSize: 24,
          ),
          FxBottomNavigationBarItem(
            page: EstateSearchScreen(),
            activeIconData: Icons.search,
            iconData: Icons.search,
            activeIconSize: 24,
            iconSize: 24,
          ),
          FxBottomNavigationBarItem(
              page: EstateChatScreen(),
              activeIconData: Icons.chat,
              iconData: Icons.chat_outlined,
              activeIconSize: 22,
              iconSize: 24),
          FxBottomNavigationBarItem(
            page: EstateProfileScreen(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline,
            activeIconSize: 24,
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
