// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RapidAPIRepsonse _$RapidAPIRepsonseFromJson(Map<String, dynamic> json) =>
    RapidAPIRepsonse(
      get: json['get'] as String? ?? '',
      parameters: json['parameters'] ?? const {},
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      results: json['results'] as int? ?? 0,
      paging: json['paging'] ?? const {},
      response: json['response'] ?? const {},
    );

Map<String, dynamic> _$RapidAPIRepsonseToJson(RapidAPIRepsonse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.response,
    };
