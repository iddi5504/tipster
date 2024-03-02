import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/core/methods.dart';
import 'package:tipster/routes/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipster'),
        backgroundColor: Colors.amberAccent,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 30),
            ),
            TextButton.icon(
                onPressed: () {
                  showSnackBar(context, 'This is a message');
                },
                icon: Icon(Icons.show_chart),
                label: Text('Show SnackBar'))
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    await firebaseAuth
        .signOut()
        .then((value) => context.router.pushAndPopUntil(
              LoginRoute(),
              predicate: (route) => false,
            ))
        .catchError((error) => showSnackBar(context, error.toString()));
  }
}
