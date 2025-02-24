import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddRemoveWishListResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';

abstract class WishlistRepository {

  Future<Either<Failures,GetWishListResponseEntity>> getWishList ();
  Future<Either<Failures,AddRemoveWishListResponseEntity>> addTOWishList (String productID);
  Future<Either<Failures,AddRemoveWishListResponseEntity>> removeFromWishList (String productID);

}