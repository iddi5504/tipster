import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tipster/core/constants.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/features/auth/cubit/auth_cubit.dart';
import 'package:tipster/models/user_models.dart';
import 'package:tipster/routes/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<AuthCubit>().state.user!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        shape: const CircleBorder(),
      ),
      appBar: AppBar(
        title: const Text('Tipster'),
        backgroundColor: Colors.amberAccent,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => openDrawer(context),
              icon: const Icon(Icons.dashboard));
        }),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
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
                        radius: 35,
                        backgroundImage: CachedNetworkImageProvider(App.name,
                            cacheKey: context
                                    .read<AuthCubit>()
                                    .state
                                    .user
                                    ?.profileImageURL ??
                                '',
                            scale: 1),
                      ),
                      TextButton.icon(
                          onPressed: () =>
                              context.router.popAndPush(const ProfileRoute()),
                          icon: const Icon(Icons.update),
                          label: const Text("Update"))
                    ],
                  ),
                  hSpace2,
                  Text(
                    user.email,
                    style: const TextStyle(color: Colors.amber),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Tipster rank',
                        style: TextStyle(color: Colors.white),
                      ),
                      wSpace2,
                      Text(
                        user.rank.toString(),
                        style: const TextStyle(color: Colors.amber),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),
              onTap: () {
                context.router.push(const ProfileRoute());
              },
            )
          ],
        ),
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
                  icon: const Icon(Icons.show_chart),
                  label: const Text('Show SnackBar'))
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
