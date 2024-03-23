import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tipster/routes/app_router.gr.dart';

@RoutePage()
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => TabsScreensStat();
}

class TabsScreensStat extends State<TabsScreen> {
  List<PageRouteInfo> routes = const [
    HomeRoute(),
    MatchesRoute(),
    ProfileRoute()
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            elevation: 10,
            enableFeedback: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.social_distance_rounded),
                label: 'Matches',
                tooltip: 'matches',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  tooltip: 'Profile'),
            ],
            onTap: tabsRouter.setActiveIndex);
      },
    );
  }
}
