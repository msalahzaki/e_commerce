import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';


abstract class GetAllCategoriesRemoteDatasource {
  Future<Either<Failures,AllCategoriesEntity>> getAllCategories ();

}
