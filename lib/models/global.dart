import 'package:json_annotation/json_annotation.dart';

part 'global.g.dart';

@JsonSerializable()
class RapidAPIRepsonse {
  final String get;
  final dynamic parameters;
  final List<String> errors;
  final int results;
  final dynamic paging;
  final dynamic response;

  RapidAPIRepsonse({
    this.get = '',
    this.parameters = const {},
    this.errors = const [],
    this.results = 0,
    this.paging = const {},
    this.response = const {},
  });

  factory RapidAPIRepsonse.fromJson(Map<String, dynamic> json) =>
      _$RapidAPIRepsonseFromJson(json);

  Map<String, dynamic> toJson() => _$RapidAPIRepsonseToJson(this);
}
