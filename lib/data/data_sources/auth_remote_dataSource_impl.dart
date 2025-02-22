import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/api/api_manger.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/core/shared_preference_utils.dart';
import 'package:e_commerce/data/model/LoginResponse.dart';
import 'package:e_commerce/data/model/RegisterDataModel.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';

import 'package:e_commerce/domain/repositories/dataSource/auth_remote_dataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  ApiManger apiManger;

  AuthRemoteDatasourceImpl(this.apiManger);

  @override
  Future<Either<Failures, RegisterDataModel>> register(
      String name, String phone, String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManger
            .postData(endpoint: EndPoints.registerEndpoint, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": password,
          "phone": phone
        });

        RegisterDataModel registerDataModel =
            RegisterDataModel.fromJson(response!.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerDataModel);
        } else {
          return Left(ServerError(errorMessage: registerDataModel.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'No Internet Connection,Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) async{

    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    try {
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
    connectivityResult.contains(ConnectivityResult.mobile)) {
    var response = await apiManger
        .postData(endpoint: EndPoints.loginEndpoint, body: {
      "email":email,
      "password":password
    });
print(response!.data);
    LoginResponse loginResponse =
    LoginResponse.fromJson(response.data);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
       SharedPreferenceUtils.saveData(key: 'token', value: loginResponse.token);
    return Right(loginResponse);
    } else {
    return Left(ServerError(errorMessage: loginResponse.message!));
    }
    } else {
    return Left(NetworkError(
    errorMessage: 'No Internet Connection,Please check internet.'));
    }
    } catch (e) {
    return Left(Failures(errorMessage: e.toString()));
    }
  }
}
