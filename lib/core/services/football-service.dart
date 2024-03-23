import 'dart:convert';

import 'package:tipster/core/services/football-client.dart';
import 'package:tipster/models/fixture_models.dart';

class FootBallService {
  FootBallClient footBallClient;
  FootBallService({required this.footBallClient});

  Future<List<Fixture>> getFixtures(FixturesParams params) async {
    final res = await footBallClient.get('/fixtures', params.toJson());
    print(res.data.response);
    return (res.data.response as List<dynamic>)
        .map((e) => Fixture.fromJson(e))
        .toList();
  }
}
