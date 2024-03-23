// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixturesParams _$FixturesParamsFromJson(Map<String, dynamic> json) =>
    FixturesParams(
      live: json['live'] as String?,
      id: json['id'] as String?,
      league: json['league'] as String?,
      season: json['season'] as String?,
      team: json['team'] as String?,
      last: json['last'] as String?,
      next: json['next'] as String?,
      round: json['round'] as String?,
      timezone: json['timezone'] as String?,
      status: json['status'] as String?,
      venue: json['venue'] as String?,
      ids: json['ids'] as String?,
    );

Map<String, dynamic> _$FixturesParamsToJson(FixturesParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('live', instance.live);
  writeNotNull('id', instance.id);
  writeNotNull('league', instance.league);
  writeNotNull('season', instance.season);
  writeNotNull('team', instance.team);
  writeNotNull('last', instance.last);
  writeNotNull('next', instance.next);
  writeNotNull('round', instance.round);
  writeNotNull('timezone', instance.timezone);
  writeNotNull('status', instance.status);
  writeNotNull('venue', instance.venue);
  writeNotNull('ids', instance.ids);
  return val;
}

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      id: json['id'] as int?,
      referee: json['referee'],
      timezone: json['timezone'] as String?,
      date: json['date'] as String?,
      timestamp: json['timestamp'] as int?,
      periods: json['periods'] == null
          ? null
          : Periods.fromJson(json['periods'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      teams: json['teams'] == null
          ? null
          : Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: json['score'] == null
          ? null
          : Score.fromJson(json['score'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('referee', instance.referee);
  writeNotNull('timezone', instance.timezone);
  writeNotNull('date', instance.date);
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('periods', instance.periods);
  writeNotNull('venue', instance.venue);
  writeNotNull('status', instance.status);
  writeNotNull('league', instance.league);
  writeNotNull('teams', instance.teams);
  writeNotNull('goals', instance.goals);
  writeNotNull('score', instance.score);
  writeNotNull('events', instance.events);
  return val;
}

Periods _$PeriodsFromJson(Map<String, dynamic> json) => Periods(
      first: json['first'] as int?,
      second: json['second'],
    );

Map<String, dynamic> _$PeriodsToJson(Periods instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first', instance.first);
  writeNotNull('second', instance.second);
  return val;
}

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$VenueToJson(Venue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('city', instance.city);
  return val;
}

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      logo: json['logo'] as String?,
      flag: json['flag'] as String?,
      season: json['season'] as int?,
      round: json['round'] as String?,
    );

Map<String, dynamic> _$LeagueToJson(League instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('country', instance.country);
  writeNotNull('logo', instance.logo);
  writeNotNull('flag', instance.flag);
  writeNotNull('season', instance.season);
  writeNotNull('round', instance.round);
  return val;
}

Teams _$TeamsFromJson(Map<String, dynamic> json) => Teams(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      away: Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('logo', instance.logo);
  writeNotNull('winner', instance.winner);
  return val;
}

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('home', instance.home);
  writeNotNull('away', instance.away);
  return val;
}

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      halftime: Goals.fromJson(json['halftime'] as Map<String, dynamic>),
      fulltime: Goals.fromJson(json['fulltime'] as Map<String, dynamic>),
      extratime: Goals.fromJson(json['extratime'] as Map<String, dynamic>),
      penalty: Goals.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
      assist: Assist.fromJson(json['assist'] as Map<String, dynamic>),
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      comments: json['comments'],
    );

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{
    'time': instance.time,
    'team': instance.team,
    'player': instance.player,
    'assist': instance.assist,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('detail', instance.detail);
  writeNotNull('comments', instance.comments);
  return val;
}

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      elapsed: json['elapsed'] as int?,
      extra: json['extra'],
    );

Map<String, dynamic> _$TimeToJson(Time instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('elapsed', instance.elapsed);
  writeNotNull('extra', instance.extra);
  return val;
}

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

Assist _$AssistFromJson(Map<String, dynamic> json) => Assist(
      id: json['id'],
      name: json['name'],
    );

Map<String, dynamic> _$AssistToJson(Assist instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      long: json['long'] as String?,
      short: json['short'] as String?,
      elapsed: json['elapsed'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('long', instance.long);
  writeNotNull('short', instance.short);
  writeNotNull('elapsed', instance.elapsed);
  return val;
}
