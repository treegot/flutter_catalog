import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme:  MyTheme.themeData,
      darkTheme: MyTheme.darkthemes,
      debugShowCheckedModeBanner:  false,
      initialRoute: "/home", //default screen
      routes: {
        "/":(context)=>LoginPage(),
        MyRoutes.homeRoutes:(context)=>HomePage(),
        MyRoutes.loginRoutes:(context)=>LoginPage()

      },

    );
  }
}













