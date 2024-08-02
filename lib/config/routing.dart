import 'package:go_router/go_router.dart';
import 'package:music_player/presentation/screens/home_screen/home_screen.dart';

class RouteName {
  static const home = 'home_screen';
}

final goRoutering = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
