import 'package:json_annotation/json_annotation.dart';

part 'fixture_models.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class FixturesParams {
  String? live;
  String? id;
  String? league;
  String? season;
  String? team;
  String? last;
  String? next;
  String? round;
  String? timezone;
  String? status;
  String? venue;
  String? ids;

  FixturesParams(
      {this.live,
      this.id,
      this.league,
      this.season,
      this.team,
      this.last,
      this.next,
      this.round,
      this.timezone,
      this.status,
      this.venue,
      this.ids});

  factory FixturesParams.fromJson(Map<String, dynamic> json) =>
      _$FixturesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FixturesParamsToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Fixture {
  final int? id;
  final dynamic referee;
  final String? timezone;
  final String? date;
  final int? timestamp;
  final Periods? periods;
  final Venue? venue;
  final Status? status;
  final League? league;
  final Teams? teams;
  final Goals? goals;
  final Score? score;
  final List<Event>? events;

  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
    required this.events,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);
  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Periods {
  final int? first;
  final dynamic second;

  Periods({
    required this.first,
    required this.second,
  });

  factory Periods.fromJson(Map<String, dynamic> json) =>
      _$PeriodsFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodsToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Venue {
  final int? id;
  final String? name;
  final String? city;

  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable(includeIfNull: false)
class League {
  final int? id;
  final String? name;
  final String? country;
  final String? logo;
  final String? flag;
  final int? season;
  final String? round;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Teams {
  final Team home;
  final Team away;

  Teams({
    required this.home,
    required this.away,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Team {
  final int? id;
  final String? name;
  final String? logo;
  final bool? winner;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    this.winner,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Goals {
  final int? home;
  final int? away;

  Goals({
    this.home,
    this.away,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);
  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Score {
  final Goals halftime;
  final Goals fulltime;
  final Goals extratime;
  final Goals penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Event {
  final Time time;
  final Team team;
  final Player player;
  final Assist assist;
  final String? type;
  final String? detail;
  final dynamic comments;

  Event({
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
    required this.comments,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Time {
  final int? elapsed;
  final dynamic extra;

  Time({
    required this.elapsed,
    required this.extra,
  });

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Player {
  final dynamic id;
  final String? name;

  Player({
    required this.id,
    required this.name,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Assist {
  final dynamic id;
  final dynamic name;

  Assist({
    required this.id,
    required this.name,
  });

  factory Assist.fromJson(Map<String, dynamic> json) => _$AssistFromJson(json);
  Map<String, dynamic> toJson() => _$AssistToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Status {
  final String? long;
  final String? short;
  final int? elapsed;

  Status({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
