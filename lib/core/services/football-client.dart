import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tipster/models/global.dart';

class FootBallClient {
  late final Dio _dio;

  FootBallClient() {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.env['FOOTBALL_API_BASE_URL'] ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'X-RapidAPI-Key': dotenv.env['FOOTBALL_API_KEY'] ?? '',
        'X-RapidAPI-Host': dotenv.env['FOOTBALL_RAPID_API_HOST'] ?? ''
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ));
  }

  Future<ResponseEntity> get(String path, dynamic query) async {
    final res = await _dio.get(
      path,
      queryParameters: query,
    );
    return handleResponse(res);
  }

  ResponseEntity handleResponse(Response response) {
    if (response.statusCode == 200) {
      return ResponseEntity(
          status: ResponseStatus.success,
          data: RapidAPIRepsonse.fromJson(response.data));
    } else {
      return ResponseEntity(
          status: ResponseStatus.error, data: RapidAPIRepsonse());
    }
  }
}

enum ResponseStatus { success, error }

class ResponseEntity {
  ResponseStatus status;
  RapidAPIRepsonse data;
  ResponseEntity({
    required this.status,
    required this.data,
  });
}
