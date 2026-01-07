import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:myghm_mobile/features/auth/password/reset/presentation/pages/reset_password_page.dart';
import 'package:myghm_mobile/features/profile/presentation/pages/bank_data_page.dart';
import 'package:myghm_mobile/features/profile/presentation/pages/family_data_page.dart';

import 'package:myghm_mobile/features/profile/presentation/pages/personal_data_page.dart';
import 'package:myghm_mobile/features/profile/presentation/pages/profile_page.dart';

import 'package:myghm_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:myghm_mobile/features/auth/login/presentation/pages/login_page.dart';
import 'package:myghm_mobile/features/auth/register/presentation/pages/register_page.dart';
import 'package:myghm_mobile/features/salary_slip/presentation/pages/salary_slip_page.dart';

import 'package:myghm_mobile/navigation/shell/app_navigation_shell.dart';

import 'package:myghm_mobile/features/absen/presentation/pages/absen_page.dart';
import 'package:myghm_mobile/features/form/presentation/pages/form_page.dart';
import 'package:myghm_mobile/features/employe_data/presentation/data_page.dart';

import '../../features/profile/presentation/flow/profile_flow.dart';
import '../../features/profile/presentation/pages/pp_view_page.dart';

class RoutesConfig {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      /// ======================
      /// AUTH & SPLASH
      /// ======================
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),

      /// ======================
      /// MAIN SHELL (BOTTOM NAV)
      /// ======================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          /// HOME
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/absen',
                builder: (context, state) => const AbsenPage(),
              ),
            ],
          ),

          /// FORM
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/form',
                builder: (context, state) => const FormPage(),
              ),
            ],
          ),

          /// DATA
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/data',
                builder: (context, state) => const DataPage(),
              ),
            ],
          ),

          /// SALARY
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/salary',
                builder: (context, state) => const SalarySlipPage(),
              ),
            ],
          ),

          /// PROFILE
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    ProfileFlow(child: const ProfilePage()),
              ),
            ],
          ),
        ],
      ),

      /// ======================
      /// DETAIL PAGE (NO NAVBAR)
      /// ======================

      /// PROFILE
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/personal_data',
        builder: (context, state) =>
            ProfileFlow(child: const PersonalDataPage()),
      ),
      GoRoute(
        path: '/profile_photo_view',
        builder: (context, state) => ProfileFlow(child: ProfilePhotoViewPage()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/family_data',
        builder: (context, state) => FamilyDataPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/bank_data',
        builder: (context, state) => BankDataPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/reset_password',
        builder: (context, state) => ResetPasswordPage(),
      ),
    ],
  );
}
