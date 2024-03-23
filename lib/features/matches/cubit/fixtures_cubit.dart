import 'package:bloc/bloc.dart';
import 'package:tipster/core/services/football-service.dart';
import 'package:tipster/models/fixture_models.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesState> {
  FootBallService footBallService;
  FixturesCubit({required this.footBallService}) : super(FixturesState());

  Future getFixtures(FixturesParams params) async {
    try {
      emit(state.copyWith(status: FixturesStatus.loading));
      await footBallService.getFixtures(params).then((value) {
        print(value);
        emit(state.copyWith(fixtures: value, status: FixturesStatus.loaded));
      });
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(status: FixturesStatus.error));
    }
  }
}
