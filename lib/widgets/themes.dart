import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{

  static ThemeData  get themeData =>
      ThemeData(primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.white,
          canvasColor: creamcolor,
          buttonColor: darkBluishColor,
          accentColor: darkBluishColor,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black,
                  fontSize: 20)
          ));

  static ThemeData get darkthemes=> ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.black,
              fontSize: 20)
      ),

  );
  //colors
 static Color creamcolor=Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray800;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}