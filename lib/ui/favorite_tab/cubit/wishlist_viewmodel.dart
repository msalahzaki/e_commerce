import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/usecases/getWishList_useCase.dart';
import 'package:e_commerce/ui/favorite_tab/cubit/wishList_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistViewmodel extends Cubit<WishlistStates>{
  WishlistViewmodel(this.getWishListUseCase):super(GetWishlistLoadingState());
    GetWishListUseCase getWishListUseCase;
  List<WishListDataEntity> wishListProducts =[] ;

  Future<bool> getWishList( )async{
    emit(GetWishlistLoadingState());
    var either = await getWishListUseCase.invoke();
    either.fold((error){
      emit(GetWishlistErrorState(error.errorMessage));
    }, (cartResponse){
      wishListProducts= cartResponse.products!;
       emit(GetWishlistSuccessState(cartResponse));
      return true;
    });
    return false;
  }

}