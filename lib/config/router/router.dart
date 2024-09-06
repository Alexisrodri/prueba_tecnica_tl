import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/Home', routes: [
  GoRoute(
    path: '/Home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/sign-documents',
    builder: (context, state) => const SingDocumentScreen(),
  ),
]);
