import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/features/auth/cubit/auth_cubit.dart';
import 'package:tipster/features/auth/login.dart';
import 'package:tipster/features/home/index.dart';
import 'package:tipster/routes/app_router.gr.dart';
import 'package:tipster/splashScreen.dart';

@RoutePage()
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.authStatus == AuthStatus.unauthenticated) {
              context.router.popAndPush(const LoginRoute());
            }
            if (state.profileComplete == false) {
              context.router.popAndPush(const ProfileRoute());
            }
          },
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.authStatus == AuthStatus.authenticated) {
            return const HomeScreen();
          } else if (state.authStatus == AuthStatus.unauthenticated) {
            return const LoginScreen();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
