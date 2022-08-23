import 'package:go_router/go_router.dart';

import '../../errors/pages/page_not_found_page.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login_page.dart';
import '../../sign_up/pages/sign_up_page.dart';
import '../banners/general_beta_banner.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    // GoRoute(
    //   path: SplashPage.routeName,
    //   builder: (context, state) => const SplashPage(),
    // ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const GeneralBetaBanner(child: HomePage()),
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const GeneralBetaBanner(child: LoginPage()),
    ),
    GoRoute(
      path: SignUpPage.routeName,
      builder: (context, state) => const GeneralBetaBanner(child: SignUpPage()),
    ),
    GoRoute(
      path: PageNotFoundPage.routeName,
      builder: (context, state) => const GeneralBetaBanner(
        child: PageNotFoundPage(),
      ),
    ),
  ],
  errorBuilder: (context, state) => GeneralBetaBanner(
    child: PageNotFoundPage(exception: state.error),
  ),
);
