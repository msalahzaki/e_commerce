import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddRemoveWishListResponseEntity.dart';

import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';

import 'package:e_commerce/domain/repositories/dataSource/wishList_dataSource.dart';

import 'package:e_commerce/domain/repositories/repository/wishList_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:WishlistRepository)
class WishlistRepositoryImpl extends WishlistRepository{
  WishListDataSource wishListDataSource;

  WishlistRepositoryImpl(this.wishListDataSource);

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getWishList() {
    return wishListDataSource.getWishList();
  }

  @override
  Future<Either<Failures, AddRemoveWishListResponseEntity>> addTOWishList(String productID) {
    return wishListDataSource.addTOWishList(productID);
  }

  @override
  Future<Either<Failures, AddRemoveWishListResponseEntity>> removeFromWishList(String productID) {
   return wishListDataSource.removeFromWishList(productID);
  }



}