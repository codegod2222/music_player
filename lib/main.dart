import 'package:flutter/material.dart';
import 'package:music_player/config/routing.dart';
import 'package:music_player/config/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return MaterialApp.router(
        title: 'Music Player',
        debugShowCheckedModeBanner: false,
        routerConfig: goRoutering,
        theme: themeData(),
      );
    });
  }
}
