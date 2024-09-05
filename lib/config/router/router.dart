import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/screens/home_screen.dart';
import 'package:prueba_tecnica_tl/screens/sign_document.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/Home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/sign-documents',
    builder: (context, state) => const SignDocument(),
  ),
]);
