

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failures.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/repositories/repository/wishList_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListUseCase {
  GetWishListUseCase(this.wishlistRepository);
  WishlistRepository wishlistRepository ;

  Future<Either<Failures,GetWishListResponseEntity>> invoke (){
    return wishlistRepository.getWishList();
  }


}