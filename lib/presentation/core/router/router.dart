import 'package:go_router/go_router.dart';

import '../../errors/pages/page_not_found_page.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login_page.dart';
import '../../sign_up/pages/sign_up_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: PageNotFoundPage.routeName,
      builder: (context, state) => const PageNotFoundPage(),
    ),
  ],
  errorBuilder: (context, state) => PageNotFoundPage(exception: state.error),
);
