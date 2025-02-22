import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';

abstract class CartDatasource {

  Future<Either<Failures,AddToCartResponseEntity>> addToCart (String productId);
  Future<Either<Failures,GetCardResponseEntity>> getCart ();
  Future<Either<Failures,GetCardResponseEntity>> updateProductCount (String newCount,String productID);

}