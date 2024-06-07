import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
part 'color_schemes.dart';

ThemeData get darkTheme => ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  appBarTheme: AppBarTheme(color: _darkColorScheme.primary),
);

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _lightColorScheme.secondary,
    selectionHandleColor: _lightColorScheme.secondary,
    selectionColor: _lightColorScheme.secondary,
  ),
  checkboxTheme: const CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: _lightColorScheme.primary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: _lightColorScheme.primary,
    ),
    actionsIconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
    iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: _lightColorScheme.onPrimary,
    ),
  ),
  sliderTheme: SliderThemeData(
    thumbColor: _lightColorScheme.primary,
    activeTrackColor: _lightColorScheme.secondary,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(Colors.grey),
    radius: const Radius.circular(8),
    trackVisibility: WidgetStateProperty.all(true),
    interactive: true,
    thickness: WidgetStateProperty.all(10),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: _lightColorScheme.primary,
  ),
  chipTheme: ChipThemeData(
    labelStyle: TextStyle(
      color: _lightColorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: _lightColorScheme.scrim, size: 23),
  badgeTheme: const BadgeThemeData(
    textStyle: TextStyle(
      fontSize: 9,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: Colors.white,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white30,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _lightColorScheme.surface,
  ),
  cardTheme: CardTheme(
    color: _lightColorScheme.onPrimary,
    shadowColor: _lightColorScheme.shadow,
    shape: RoundedRectangleBorder(
      side: const BorderSide(),
      borderRadius: BorderRadius.circular(15), // Set the border radius
    ),
    elevation: 2,
    margin: const EdgeInsets.all(5),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.surface,
      disabledBackgroundColor: _lightColorScheme.outline.withOpacity(0.5),
      disabledForegroundColor: _lightColorScheme.surface,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>((Set states) {
      if(states.contains(WidgetState.disabled)){
        return Colors.black26;
      }
      if (states.contains(WidgetState.selected)) {
        return _lightColorScheme.primary;
      }
      return _lightColorScheme.primary.withOpacity(0.5);
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((Set states) {
      if(states.contains(WidgetState.disabled)){
        return Colors.grey;
      }
      if (states.contains(WidgetState.selected)) {
        return _lightColorScheme.secondary;
      }
      return _lightColorScheme.secondary.withOpacity(0.5);
    }),
    thumbIcon: WidgetStateProperty.resolveWith<Icon>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Icon(
            Icons.check,
            color: _lightColorScheme.surface,
          );
        }
        return Icon(
          Icons.close,
          color: _lightColorScheme.surface,
        );
      },
    ),
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
);
