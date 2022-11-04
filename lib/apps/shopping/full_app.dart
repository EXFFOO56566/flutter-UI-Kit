import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/custom/navigation/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'cart_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class ShoppingFullApp extends StatefulWidget {
  @override
  _ShoppingFullAppState createState() => _ShoppingFullAppState();
}

class _ShoppingFullAppState extends State<ShoppingFullApp> {
  int _currentIndex = 1;
  PageController? _pageController;

  late NavigationTheme navigationTheme;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    _pageController = PageController(initialPage: 1);
    navigationTheme = NavigationTheme.getNavigationTheme();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.primaryColor.withAlpha(10))),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Scaffold(
            body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: <Widget>[
                  ShoppingHomeScreen(),
                  ShoppingSearchScreen(),
                  ShoppingCartScreen(),
                  ShoppingProfileScreen(
                    root: context,
                  )
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavigation(
              animationDuration: Duration(milliseconds: 350),
              selectedItemOverlayColor: navigationTheme.selectedOverlayColor,
              backgroundColor: navigationTheme.backgroundColor,
              selectedIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
                _pageController!.jumpToPage(index);
              },
              items: <CustomBottomNavigationBarItem>[
                CustomBottomNavigationBarItem(
                    title: "Home",
                    icon: Icon(MdiIcons.storeOutline, size: 22),
                    activeIcon: Icon(MdiIcons.store, size: 22),
                    activeColor: navigationTheme.selectedItemColor,
                    inactiveColor: navigationTheme.unselectedItemColor),
                CustomBottomNavigationBarItem(
                    title: "Search",
                    icon: Icon(MdiIcons.magnify, size: 22),
                    activeIcon: Icon(MdiIcons.magnify, size: 22),
                    activeColor: navigationTheme.selectedItemColor,
                    inactiveColor: navigationTheme.unselectedItemColor),
                CustomBottomNavigationBarItem(
                    title: "Cart",
                    icon: Icon(MdiIcons.cartOutline, size: 22),
                    activeIcon: Icon(MdiIcons.cart, size: 22),
                    activeColor: navigationTheme.selectedItemColor,
                    inactiveColor: navigationTheme.unselectedItemColor),
                CustomBottomNavigationBarItem(
                    title: "Profile",
                    icon: Icon(
                      MdiIcons.accountOutline,
                      size: 22,
                    ),
                    activeIcon: Icon(
                      MdiIcons.account,
                      size: 22,
                    ),
                    activeColor: navigationTheme.selectedItemColor,
                    inactiveColor: navigationTheme.unselectedItemColor),
              ],
            ),
          )),
    );
  }
}
