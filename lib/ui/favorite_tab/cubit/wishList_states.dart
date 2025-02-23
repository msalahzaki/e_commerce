import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';

class WishlistStates {}

class GetWishlistLoadingState extends WishlistStates{}

class GetWishlistErrorState extends WishlistStates{
  String errorMessage;

  GetWishlistErrorState(this.errorMessage);
}

class GetWishlistSuccessState extends WishlistStates{
  GetWishListResponseEntity getWishListResponseEntity ;
  GetWishlistSuccessState(this.getWishListResponseEntity);
}