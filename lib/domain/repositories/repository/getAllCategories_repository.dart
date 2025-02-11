import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/LoginEntity.dart';
import 'package:e_commerce/domain/entities/RegisterEntity.dart';

abstract class GetAllCategoriesRepository {
    Future<Either<Failures,AllCategoriesEntity>> getAllCategories ();

}
