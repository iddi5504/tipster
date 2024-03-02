import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/features/auth/sign_up.dart';
import 'package:tipster/features/home/index.dart';
import 'package:tipster/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initiatilizeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }

  bool get isUserLoggedIn => firebaseAuth.currentUser != null;
}
