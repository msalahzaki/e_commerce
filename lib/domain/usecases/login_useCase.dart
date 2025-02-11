
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/failures.dart';


@injectable
class LoginUseCase {
  AuthRepository authRepository;


LoginUseCase(this.authRepository);

Future<Either<Failures, LoginEntity>> invoke(String email,String password){
  return  authRepository.login(email, password);
  }
}