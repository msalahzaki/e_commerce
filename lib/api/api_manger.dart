
import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_const.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManger {
  final Dio dio = Dio(

  );

  Future<Response?> getData({ required String endpoint, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters,  Map<String, dynamic>? body, }) async {
    try {
      Response response = await dio.get(
        ApiConst.baseAuthURL+endpoint,
        options: Options(headers: headers,validateStatus: (status) => true,),
        queryParameters: queryParameters,
        data: body
      );
      return response;
    } catch (e) {
      print('Error: \$e');
      return null;
    }
  }
  Future<Response?> postData({ required String endpoint, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters,  Map<String, dynamic>? body, }) async {
    try {
      Response response = await dio.post(
        ApiConst.baseAuthURL+endpoint,
        options: Options(headers: headers,validateStatus: (status) => true,),
        queryParameters: queryParameters,
        data: body
      );
      return response;
    } catch (e) {
      print('Error: \$e');
      return null;
    }
  }
}


