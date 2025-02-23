import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/repositories/dataSource/cart_dataSource.dart';
import 'package:e_commerce/domain/repositories/dataSource/wishList_dataSource.dart';
import 'package:e_commerce/domain/repositories/repository/cart_repository.dart';
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



}