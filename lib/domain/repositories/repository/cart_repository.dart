import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';

import '../../../core/failures.dart';

abstract class CartRepository {

  Future<Either<Failures,AddToCartResponseEntity>> addToCart (String productId);
  Future<Either<Failures,GetCardResponseEntity>> getCart ();
  Future<Either<Failures,GetCardResponseEntity>> updateProductCount (String newCount,String productID);

}