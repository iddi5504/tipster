import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: App.page,
          initial: true,
        ),
        AutoRoute(page: TabsRoute.page, children: [
          AutoRoute(
            page: ProfileRoute.page,
          ),
          AutoRoute(page: MatchesRoute.page),
          AutoRoute(
            page: HomeRoute.page,
          ),
        ]),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
      ];
}
