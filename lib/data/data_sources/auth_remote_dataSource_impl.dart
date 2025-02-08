import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/auth_remote_dataSource.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource{
  @override
  Future<Either<Failures, RegisterEntity>> register(String name, String phone, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}