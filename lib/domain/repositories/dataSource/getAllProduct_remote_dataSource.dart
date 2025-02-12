import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';


abstract class GetAllProductRemoteDatasource {
  Future<Either<Failures,GetAllProductsEntity>> getAllProductByCategory (String categoryID);

}
