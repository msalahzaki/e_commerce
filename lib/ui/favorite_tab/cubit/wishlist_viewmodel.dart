import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerce/domain/usecases/addToCart_useCase.dart';
import 'package:e_commerce/domain/usecases/addToWishList_useCase.dart';
import 'package:e_commerce/domain/usecases/getWishList_useCase.dart';
import 'package:e_commerce/domain/usecases/removeFromWishList_useCase.dart';
import 'package:e_commerce/ui/favorite_tab/cubit/wishList_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistViewmodel extends Cubit<WishlistStates>{
  WishlistViewmodel(this.getWishListUseCase,this.removeFromWishListUseCase,this.addToWishListUseCase):super(GetWishlistLoadingState());
    GetWishListUseCase getWishListUseCase;
   AddToWishListUseCase addToWishListUseCase;
   RemoveFromWishListUseCase removeFromWishListUseCase;
  List<WishListDataEntity> wishListProducts =[] ;
  List<String> wishListProductsIDs =[] ;

  static WishlistViewmodel get(context) => BlocProvider.of(context);

  Future<bool> getWishList( )async{
    emit(GetWishlistLoadingState());
    var either = await getWishListUseCase.invoke();
    either.fold((error){
      emit(GetWishlistErrorState(error.errorMessage));
    }, (cartResponse){
      wishListProducts= cartResponse.products!;
      wishListProductsIDs= wishListProducts.map((e) => e.id!).toList();
       emit(GetWishlistSuccessState(cartResponse));
      return true;
    });
    return false;
  }

  Future<bool> addToWishList(String productID)async{
       // emit(GetWishlistLoadingState());
    var either = await addToWishListUseCase.invoke(productID);
    either.fold((error){
      emit(GetWishlistErrorState(error.errorMessage));
    }, (cartResponse){
      wishListProductsIDs=cartResponse.productsIDs ?? [];
      emit(AddToListState());
   // getWishList();
      return true;
    });
    return false;
  }
  Future<bool> removeFromWishList(String productID)async{
       // emit(GetWishlistLoadingState());
    var either = await removeFromWishListUseCase.invoke(productID);
    either.fold((error){
      emit(GetWishlistErrorState(error.errorMessage));
    }, (cartResponse){
      wishListProductsIDs=cartResponse.productsIDs ?? [];
      wishListProducts.removeWhere((element) => element.id == productID,);
      emit(RemoveFromListState());
      return true;
    });
    return false;
  }

  bool isInWishList(String productID){
    return wishListProductsIDs.contains(productID);
  }


}