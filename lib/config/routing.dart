import 'package:go_router/go_router.dart';
import 'package:music_player/presentation/screens/home_screen/home_screen.dart';

/// A class to hold route names for easy reference.
class RouteName {
  /// The route name for the home screen.
  static const home = 'home_screen';
}

/// The GoRouter configuration for the application.
///
/// This configuration defines the routes and their corresponding builders.
final goRoutering = GoRouter(
  /// The initial location for the router.
  initialLocation: '/home',

  /// The list of routes for the application.
  routes: [
    /// The route for the home screen.
    GoRoute(
      /// The path for the home screen route.
      path: '/home',

      /// The name for the home screen route.
      name: RouteName.home,

      /// The builder function for the home screen route.
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
