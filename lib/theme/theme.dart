import 'package:flutter/cupertino.dart';

abstract class Theme {
  static Color lightBackground = CupertinoColors.lightBackgroundGray;
  static Color darkBackground = CupertinoColors.black;
  static Color secondaryDarkBackground = CupertinoColors.darkBackgroundGray;
  static Color secondaryLightBackground = CupertinoColors.white;

  const Theme._();

  static final light = CupertinoThemeData(
    brightness: Brightness.light,
    barBackgroundColor: lightBackground,
    scaffoldBackgroundColor: lightBackground,
  );

  static final dark = CupertinoThemeData(
    brightness: Brightness.dark,
    barBackgroundColor: darkBackground,
    scaffoldBackgroundColor: darkBackground,
  );
}
