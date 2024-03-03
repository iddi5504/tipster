import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tipster/core/constants.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/core/methods.dart';
import 'package:tipster/features/auth/cubit/auth_cubit.dart';
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
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => openDrawer(context),
              icon: Icon(Icons.dashboard));
        }),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      drawer: Drawer(
        elevation: 0.5,
        backgroundColor: Colors.black.withAlpha(200),
        shape: const ContinuousRectangleBorder(),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 50,
                          child: Image(
                              image: NetworkImage(
                            context
                                    .read<AuthCubit>()
                                    .state
                                    .user
                                    ?.profileImageURL ??
                                '',
                          ))),
                      TextButton.icon(
                          onPressed: () =>
                              context.router.popAndPush(const ProfileRoute()),
                          icon: const Icon(Icons.update),
                          label: const Text("Update"))
                    ],
                  ),
                  hSpace2,
                  Text(
                    firebaseAuth.currentUser?.email ?? '',
                    style: const TextStyle(color: Colors.amber),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                context.router.push(const ProfileRoute());
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile', tooltip: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) {}
        },
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 30),
              ),
              TextButton.icon(
                  onPressed: () => openDrawer(context),
                  icon: Icon(Icons.show_chart),
                  label: Text('Show SnackBar'))
            ],
          ),
        );
      }),
    );
  }

  Future<void> logout() async {
    await context.read<AuthCubit>().logout();
  }

  openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
