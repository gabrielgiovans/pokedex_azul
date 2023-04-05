import 'package:dio/dio.dart';

import 'dio_client.dart';

class DioClientImplementation implements IDioClient {
  final client = Dio();
  @override
  Future<DioResponse> get(String url) async {
    final response = await client.get(url);

    return DioResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
