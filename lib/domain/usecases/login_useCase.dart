
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';

import '../../core/failures.dart';
import '../entities/RegisterEntity.dart';

class LoginUseCase {
AuthRepository authRepository ;

LoginUseCase(this.authRepository);

Future<Either<Failures, LoginEntity>> invoke(String email,String password){
  return  authRepository.login(email, password);
  }
}