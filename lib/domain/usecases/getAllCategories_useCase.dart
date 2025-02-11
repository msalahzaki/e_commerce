
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/repositories/repository/getAllCategories_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/failures.dart';


@injectable
class GetAllCategoriesUseCase {
  GetAllCategoriesRepository getAllCategoriesRepository;


  GetAllCategoriesUseCase(this.getAllCategoriesRepository);

  Future<Either<Failures,AllCategoriesEntity>> invoke ()async{
    return await getAllCategoriesRepository.getAllCategories();
  }
}