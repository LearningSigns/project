import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff167FFC);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff167FFC),
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 5,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily:
              'SansaSoft', // Establecer el fontFamily para todos los textos
        ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        fontFamily: 'SansaSoft',
      ),
    ),
  );
}

class ColorsApp {
  static const Color backgroundColor = Color(0xffEFF3F4);
  static const Color backgroundColorApp = Color(0xffEFF3F4);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color colorCard = Color(0xFFE5ECFF);
  static const Color colorField = Color(0xFFCED3DB);
  static const Color textColor = Color(0xff122F4D);
  static const Color primary2 = Color(0xff145388);
  static const Color primary = Color(0xff167FFC);
  static const Color secondary = Color(0xFF0E244B);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color blue = Color(0xff2990cb);
  static const Color success = Color(0xff19B95C);
  static const Color info = Color(0xff9DC7F8);
  static const Color warning = Color(0xffFCC78B);
  static const Color error = Color(0xffEB5757);
  static const Color theme5 = Color(0xffB9406B);
  static const Color theme6 = Color(0xff008ECC);
  static const Color theme7 = Color(0xff922C88);
  static const Color theme8 = Color(0xffC0A145);
  static const Color theme9 = Color(0xff48494B);
  static const Color theme10 = Color(0xff0C7785);

  static Color _theme = const Color(0xff004394);

  static Color get theme => _theme;
  static void setTheme(Color color) {
    _theme = color;
  }
}

class InputDecorations {
  static InputDecoration authInputDecoracion({
    required String hintText,
    IconData? suffixIcon,
    IconButton? iconButton,
    Color? colorBackground,
  }) {
    return InputDecoration(
        isDense: true, // Reduce la densidad
        contentPadding: const EdgeInsets.all(20.0), // Ajusta el padding interno
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsApp.theme9),
            borderRadius: BorderRadius.circular(15.0)),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: ColorsApp.theme , width: 2),
        // ),
        filled: true,
        fillColor: colorBackground ?? ColorsApp.colorCard,
        hintText: hintText,
        labelStyle: const TextStyle(color: ColorsApp.colorCard),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: ColorsApp.theme)
            : iconButton);
  }
}
