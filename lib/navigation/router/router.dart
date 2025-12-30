import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/form_page.dart';

import '../../features/profile/presentation/pages/profile_page.dart';
import '../shell/app_navigation_shell.dart';
import '../../data_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../home_page.dart';
import '../../features/auth/login/presentation/pages/login_page.dart';
import '../../features/auth/register/presentation/pages/register_page.dart';
import '../../features/salary_slip/presentation/pages/salary_slip_page.dart';

class RoutesConfig {
  static final appRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wishlist',
                builder: (context, state) => const FormPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/data',
                builder: (context, state) => const DataPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/salary',
                builder: (context, state) => const SalarySlipPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
