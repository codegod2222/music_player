import 'package:flutter/material.dart';
import 'package:music_player/config/routing.dart'; // Imports routing configuration
import 'package:music_player/config/theme.dart'; // Imports theme configuration
import 'package:responsive_builder/responsive_builder.dart'; // Imports responsive builder for adaptive UI

/// The main entry point for the music player application.
void main() {
  runApp(const MainApp()); // Runs the MainApp widget
}

/// The root widget of the music player application.
///
/// This widget is responsible for setting up the MaterialApp and handling
/// responsiveness using the ResponsiveApp widget.
class MainApp extends StatelessWidget {
  /// Creates a new instance of the MainApp widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      // Uses ResponsiveApp for adaptive UI
      builder: (context) {
        return MaterialApp.router(
          // Creates a MaterialApp with routing
          title: 'Music Player', // Sets the application title
          debugShowCheckedModeBanner: false, // Hides the debug banner
          routerConfig: goRoutering, // Configures the router using goRoutering
          theme: themeData(), // Applies the theme data
        );
      },
    );
  }
}
