import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_notes/core/routes/routes.dart';
import 'package:personal_notes/modules/auth/authentication.dart';
import 'package:personal_notes/modules/auth/bloc/auth_bloc.dart';
import 'package:personal_notes/modules/home/bloc/home_bloc.dart';
import 'package:personal_notes/modules/home/home_screen.dart';
import 'package:personal_notes/modules/home/pages/add_notes.dart';
import 'package:personal_notes/service_locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter _router = GoRouter(
    initialLocation: Routes.auth,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.auth,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => serviceLocator.get<AuthBloc>(),
            child: const Authentication(),
          );
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => serviceLocator.get<HomeBloc>(),
            child: const HomeScreen(),
          );
        },
        routes: [
          GoRoute(
            path: Routes.addNotes,
            builder: (context, state) {
              return BlocProvider.value(
                value: serviceLocator.get<HomeBloc>(),
                child: AddNotes(
                  params: state.extra as AddNotesParams,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
  static GoRouter get appRouter => _router;
}
