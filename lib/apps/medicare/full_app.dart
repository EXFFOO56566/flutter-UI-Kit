import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'schedule_screen.dart';
import 'package:flutter/material.dart';

class MediCareFullApp extends StatefulWidget {
  @override
  _MediCareFullAppState createState() => _MediCareFullAppState();
}

class _MediCareFullAppState extends State<MediCareFullApp> {
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
      body: FxBottomNavigationBar(
        containerDecoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        activeContainerColor: customTheme.medicarePrimary.withAlpha(30),
        fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
        showActiveLabel: false,
        showLabel: false,
        activeIconSize: 24,
        iconSize: 24,
        activeIconColor: customTheme.medicarePrimary,
        iconColor: theme.colorScheme.onBackground.withAlpha(140),
        itemList: [
          FxBottomNavigationBarItem(
            page: MediCareHomeScreen(),
            activeIconData: Icons.house,
            iconData: Icons.house_outlined,
          ),
          FxBottomNavigationBarItem(
            page: MediCareScheduleScreen(),
            activeIconData: Icons.date_range,
            iconData: Icons.date_range_outlined,
          ),
          FxBottomNavigationBarItem(
            page: MediCareChatScreen(),
            activeIconData: Icons.chat_bubble,
            iconData: Icons.chat_bubble_outline_rounded,
          ),
          FxBottomNavigationBarItem(
            page: MediCareProfileScreen(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline_rounded,
          ),
        ],
      ),
    );
  }
}
