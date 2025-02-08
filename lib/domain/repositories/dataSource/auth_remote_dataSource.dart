import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failures, RegisterEntity>> register(
      String name, String phone, String email, String password);
}
