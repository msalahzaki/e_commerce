
import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_const.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManger {
  late Dio dio;



  Future<Response?> getData({ required String endpoint, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters,  Map<String, dynamic>? body, }) async {
    try {
      dio = Dio();
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
      dio = Dio();
      Response response = await dio.post(
        ApiConst.baseAuthURL+ endpoint,
        options: Options(headers: headers,validateStatus: (status) => true,),
        queryParameters: queryParameters,
        data: body
      );

      return response;
    }
    catch (e) {
      print('Error: ${e.toString()}');
      return null;
    }
  }
  Future<Response> deleteData(String endPoint, {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.delete(
      ApiConst.baseAuthURL + endPoint,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
  Future<Response> updateData(String endPoint,{Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.put(
      ApiConst.baseAuthURL + endPoint,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}


