import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';

abstract class GetAllProductRepository {
    Future<Either<Failures,GetAllProductsEntity>> getAllProductByCategory (String categoryID);
    Future<Either<Failures,GetAllProductsEntity>> getAllProduct ();
}
