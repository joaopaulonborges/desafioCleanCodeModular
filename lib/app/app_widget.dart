import 'package:desafio_modular_clean_code/app/core/util/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Brands List',
      theme: ThemeData(
        primaryColor: AppColorsTheme.primaryColor,
        accentColor: AppColorsTheme.acceptColor,
      ),
    ).modular();
  }
}
