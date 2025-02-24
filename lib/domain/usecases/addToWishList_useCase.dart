

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/AddRemoveWishListResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repository/wishList_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishListUseCase {
  AddToWishListUseCase(this.wishlistRepository);
  WishlistRepository wishlistRepository ;

  Future<Either<Failures,AddRemoveWishListResponseEntity>> invoke (String productID){
    return wishlistRepository.addTOWishList(productID);
  }


}