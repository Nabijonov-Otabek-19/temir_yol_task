import 'package:dio/dio.dart';
import '../utils/constants.dart';

class BaseApi {
  final _dio = Dio(
    BaseOptions(
      queryParameters: {'key': API_KEY},
      baseUrl: BASE_URL,
      validateStatus: (status) => true,
    ),
  );

  Dio get dio => _dio;
}
