part of 'fixtures_cubit.dart';

enum FixturesStatus { initial, loading, loaded, error }

class FixturesState {
  List<Fixture> fixtures;
  FixturesStatus status;
  FixturesState(
      {this.fixtures = const [], this.status = FixturesStatus.initial});

  FixturesState copyWith({
    List<Fixture>? fixtures,
    FixturesStatus? status,
  }) {
    return FixturesState(
      fixtures: fixtures ?? this.fixtures,
      status: status ?? this.status,
    );
  }
}
