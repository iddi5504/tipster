import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/core/services/football-service.dart';
import 'package:tipster/features/matches/cubit/fixtures_cubit.dart';
import 'package:tipster/models/fixture_models.dart';

@RoutePage()
class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  FootBallService footBallService = getIt<FootBallService>();
  FixturesCubit fixturesCubit = getIt<FixturesCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixturesCubit>(
      create: (context) => fixturesCubit,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fixturesCubit.getFixtures(FixturesParams(live: 'all'));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Matches'),
        ),
        body: BlocBuilder<FixturesCubit, FixturesState>(
          builder: (context, state) {
            if (state.status == FixturesStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == FixturesStatus.loaded) {
              return ListView.builder(
                itemCount: state.fixtures.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.fixtures[index].teams?.away.name ?? ''),
                    subtitle:
                        Text(state.fixtures[index].teams?.home.name ?? ''),
                    trailing: Text(
                        "${state.fixtures[index].goals?.away ?? 0} - ${state.fixtures[index].goals?.home ?? 0}"),
                  );
                },
              );
            } else if (state.status == FixturesStatus.error) {
              return const Center(child: Text('Error'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
