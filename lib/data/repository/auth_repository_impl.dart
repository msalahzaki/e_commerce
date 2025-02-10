import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/auth_remote_dataSource.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  AuthRemoteDatasource authRemoteDatasource ;

  AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failures, RegisterEntity>> register(String name, String phone, String email, String password) {
  return authRemoteDatasource.register(name, phone, email, password);
  }
}