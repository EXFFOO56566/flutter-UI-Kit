/*
* File : App Theme
* Version : 1.0.0
* */

import 'package:flutkit/theme/theme_type.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_theme.dart';

export 'custom_theme.dart';
export 'navigation_theme.dart';

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.ltr;

  static CustomTheme customTheme = getCustomTheme();
  static ThemeData theme = getTheme();

  static ThemeData nftTheme = getNFTTheme();

  static ThemeData cookifyTheme = AppTheme.themeType == ThemeType.light
      ? cookifyLightTheme
      : cookifyDarkTheme;

  static ThemeData cookifyLightTheme = createTheme(
    ColorScheme.fromSeed(
      seedColor: Color(0xfff57a66),
      primary: Color(0xffdf7463),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffdeeea),
      onPrimaryContainer: Color(0xffe73a1f),
      secondary: Color(0xff5e3f22),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe7bc91),
      onSecondaryContainer: Color(0xff462601),
    ),
  );
  static ThemeData cookifyDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xfffcccc5),
        primary: Color(0xfffcccc5),
        onPrimary: Color(0xffec371a),
        primaryContainer: Color(0xffec6d5a),
        onPrimaryContainer: Color(0xffffeeec),
        secondary: Color(0xfffcc18e),
        onSecondary: Color(0xff381f01),
        secondaryContainer: Color(0xff54381e),
        onSecondaryContainer: Color(0xffe7cbae),
        onBackground: Color(0xffe6e1e5)),
  );

  static ThemeData datingTheme = AppTheme.themeType == ThemeType.light
      ? datingLightTheme
      : datingDarkTheme;

  static ThemeData datingLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xffB428C3),
        secondary: Color(0xfff15f5f),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xfffcd8d8),
        onSecondaryContainer: Color(0xffea2929)),
  );
  static ThemeData datingDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xfff1b0f8),
        primary: Color(0xfff1b0f8),
        onPrimary: Color(0xff9614a4),
        primaryContainer: Color(0xffde4cef),
        onPrimaryContainer: Color(0xfff8d8fd),
        secondary: Color(0xfff88686),
        onSecondary: Color(0xff8f1313),
        secondaryContainer: Color(0xffec3535),
        onSecondaryContainer: Color(0xfff6cdcd),
        onBackground: Color(0xffe6e1e5)),
  );

  // Change
  static ThemeData estateTheme = AppTheme.themeType == ThemeType.light
      ? estateLightTheme
      : estateDarkTheme;

  static ThemeData estateLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xff1c8c8c),
        primaryContainer: Color(0xffdafafa),
        secondary: Color(0xfff15f5f),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xfff8d6d6),
        onSecondaryContainer: Color(0xff570202)),
  );
  static ThemeData estateDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xffcaffff),
        primary: Color(0xffcaffff),
        onPrimary: Color(0xff0b7777),
        primaryContainer: Color(0xff18a6a6),
        onPrimaryContainer: Color(0xffe5fdfd),
        secondary: Color(0xffeea6a6),
        onSecondary: Color(0xff491818),
        secondaryContainer: Color(0xff7a2f2f),
        onSecondaryContainer: Color(0xffefdada),
        onBackground: Color(0xffe6e1e5)),
  );

  static ThemeData homemadeTheme = AppTheme.themeType == ThemeType.light
      ? homemadeLightTheme
      : homemadeDarkTheme;

  static ThemeData homemadeLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xffc5558e),
        secondary: Color(0xffCC9D60),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xfffce7cf),
        onSecondaryContainer: Color(0xffc47712)),
  );
  static ThemeData homemadeDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xfffaafd4),
        primary: Color(0xfffaafd4),
        onPrimary: Color(0xffbb2e75),
        primaryContainer: Color(0xffd95a9b),
        onPrimaryContainer: Color(0xfffadaea),
        secondary: Color(0xffecc797),
        onSecondary: Color(0xff4f3616),
        secondaryContainer: Color(0xff855b25),
        onSecondaryContainer: Color(0xfff5e6d6),
        onBackground: Color(0xffe6e1e5)),
  );

  static ThemeData learningTheme = AppTheme.themeType == ThemeType.light
      ? learningLightTheme
      : learningDarkTheme;

  static ThemeData learningLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xff6874E8),
        secondary: Color(0xff548c2f),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffdef0d1),
        onSecondaryContainer: Color(0xff131F0a)),
  );
  static ThemeData learningDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xffcfd2ff),
        primary: Color(0xffcfd2ff),
        onPrimary: Color(0xff1529e8),
        primaryContainer: Color(0xff5563e8),
        onPrimaryContainer: Color(0xffe6e7fd),
        secondary: Color(0xffd3ebc1),
        onSecondary: Color(0xff253e14),
        secondaryContainer: Color(0xff4B7b28),
        onSecondaryContainer: Color(0xffe9f5e0),
        onBackground: Color(0xffe6e1e5)),
  );

  static ThemeData shoppingTheme = AppTheme.themeType == ThemeType.light
      ? shoppingLightTheme
      : shoppingDarkTheme;

  static ThemeData shoppingLightTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xff1c8c8c),
        primaryContainer: Color(0xffdafafa),
        secondary: Color(0xfff15f5f),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xfff8d6d6),
        onSecondaryContainer: Color(0xff570202)),
  );
  static ThemeData shoppingDarkTheme = createTheme(
    ColorScheme.fromSeed(
        seedColor: Color(0xffcaffff),
        primary: Color(0xffcaffff),
        onPrimary: Color(0xff0b7777),
        primaryContainer: Color(0xff18a6a6),
        onPrimaryContainer: Color(0xffe5fdfd),
        secondary: Color(0xffeea6a6),
        onSecondary: Color(0xff491818),
        secondaryContainer: Color(0xff7a2f2f),
        onSecondaryContainer: Color(0xffefdada),
        onBackground: Color(0xffe6e1e5)),
  );

  AppTheme._();

  static init() {
    resetFont();
    FxAppTheme.changeLightTheme(lightTheme);
    FxAppTheme.changeDarkTheme(darkTheme);
  }

  static resetFont() {
    FxTextStyle.changeFontFamily(GoogleFonts.ibmPlexSans);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w300,
      500: FontWeight.w400,
      600: FontWeight.w500,
      700: FontWeight.w600,
      800: FontWeight.w700,
      900: FontWeight.w800,
    });
  }

  static ThemeData getTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }

  static CustomTheme getCustomTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return CustomTheme.lightCustomTheme;
    return CustomTheme.darkCustomTheme;
  }

  static void changeFxTheme(ThemeType themeType) {
    if (themeType == ThemeType.light) {
      FxAppTheme.changeThemeType(FxAppThemeType.light);
    } else if (themeType == ThemeType.dark) {
      FxAppTheme.changeThemeType(FxAppThemeType.dark);
    }
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///
  static final ThemeData lightTheme = ThemeData(
    /// Brightness
    brightness: Brightness.light,

    /// Primary Color
    primaryColor: Color(0xff3C4EC5),

    /// Scaffold and Background color
    backgroundColor: Color(0xffffffff),
    scaffoldBackgroundColor: Color(0xffffffff),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(color: Color(0xff495057)),
        actionsIconTheme: IconThemeData(color: Color(0xff495057))),

    /// Card Theme
    cardTheme: CardTheme(color: Color(0xfff0f0f0)),
    cardColor: Color(0xfff0f0f0),

    textTheme: TextTheme(
        headline6: GoogleFonts.aBeeZee(), bodyText1: GoogleFonts.abel()),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff3C4EC5), brightness: Brightness.light),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff3C4EC5),
        splashColor: Color(0xffeeeeee).withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: Color(0xff3C4EC5),
        hoverColor: Color(0xff3C4EC5),
        foregroundColor: Color(0xffeeeeee)),

    /// Divider Theme
    dividerTheme: DividerThemeData(color: Color(0xffe8e8e8), thickness: 1),
    dividerColor: Color(0xffe8e8e8),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),

    /// CheckBox theme
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Color(0xffeeeeee)),
      fillColor: MaterialStateProperty.all(Color(0xff3C4EC5)),
    ),

    /// Radio theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Color(0xff3C4EC5)),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xff3C4EC5);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xff3d63ff),
      inactiveTrackColor: Color(0xff3d63ff).withAlpha(140),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Color(0xff3d63ff),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: Color(0xffeeeeee),
    highlightColor: Color(0xffeeeeee),
    errorColor: Color(0xfff0323c),
  );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static final ThemeData darkTheme = ThemeData(
    /// Brightness
    brightness: Brightness.dark,

    /// Primary Color
    primaryColor: Color(0xff069DEF),

    /// Scaffold and Background color
    scaffoldBackgroundColor: Color(0xff161616),
    backgroundColor: Color(0xff161616),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff161616)),

    /// Card Theme
    cardTheme: CardTheme(color: Color(0xff222327)),
    cardColor: Color(0xff222327),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xff069DEF), brightness: Brightness.dark),

    /// Input (Text-Field) Theme
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff069DEF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70)),
    ),

    /// Divider Color
    dividerTheme: DividerThemeData(color: Color(0xff363636), thickness: 1),
    dividerColor: Color(0xff363636),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff069DEF),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: Color(0xff069DEF),
        hoverColor: Color(0xff069DEF),
        foregroundColor: Colors.white),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff069DEF),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff069DEF), width: 2.0),
      ),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xff3C4EC5);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xff069DEF),
      inactiveTrackColor: Color(0xff069DEF).withAlpha(100),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Color(0xff069DEF),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),

    ///Other Color
    indicatorColor: Colors.white,
    disabledColor: Color(0xffa3a3a3),
    highlightColor: Colors.white.withAlpha(28),
    errorColor: Colors.orange,
    splashColor: Colors.white.withAlpha(56),
  );

  static ThemeData createTheme(ColorScheme colorScheme) {
    if (themeType != ThemeType.light) {
      return darkTheme.copyWith(
        colorScheme: colorScheme,
      );
    }
    return lightTheme.copyWith(colorScheme: colorScheme);
  }

  static ThemeData getNFTTheme() {
    if (themeType == ThemeType.light) {
      return lightTheme.copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xff232245), brightness: Brightness.light));
    } else {
      return darkTheme.copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xff232245),
              brightness: Brightness.dark,
              onBackground: Color(0xFFDAD9CA)));
    }
    // return createTheme(ColorScheme.fromSeed(seedColor: Color(0xff232245)));
  }

  static resetThemeData() {
    nftTheme = getNFTTheme();

    estateTheme = AppTheme.themeType == ThemeType.light
        ? estateLightTheme
        : estateDarkTheme;

    shoppingTheme = AppTheme.themeType == ThemeType.light
        ? shoppingLightTheme
        : shoppingDarkTheme;

    cookifyTheme = AppTheme.themeType == ThemeType.light
        ? cookifyLightTheme
        : cookifyDarkTheme;

    datingTheme = AppTheme.themeType == ThemeType.light
        ? datingLightTheme
        : datingDarkTheme;

    homemadeTheme = AppTheme.themeType == ThemeType.light
        ? homemadeLightTheme
        : homemadeDarkTheme;

    learningTheme = AppTheme.themeType == ThemeType.light
        ? learningLightTheme
        : learningDarkTheme;
  }
}
