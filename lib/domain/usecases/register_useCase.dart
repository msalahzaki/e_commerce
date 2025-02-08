import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';
import 'package:e_commerce/domain/repositories/repository/auth_repository.dart';

import '../../core/failures.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<Either<Failures, RegisterEntity>> invoke(
      String name, String phone, String email, String password) {
    return authRepository.register(name, phone, email, password);
  }
}
