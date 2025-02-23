import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';

abstract class WishListDataSource {
  Future<Either<Failures,GetWishListResponseEntity>> getWishList ();
}