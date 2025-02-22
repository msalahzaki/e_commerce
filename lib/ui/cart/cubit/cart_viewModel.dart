import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/usecases/getCart_useCase.dart';
import 'package:e_commerce/domain/usecases/updateCartProductCount_useCase.dart';
import 'package:e_commerce/ui/cart/cubit/get_card_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<GetCardStates>{
  CartViewModel(this.getCartUseCase,this.updateCartProductCountUseCase):super(GetCardLoadingState());
GetCartUseCase getCartUseCase ;
UpdateCartProductCountUseCase updateCartProductCountUseCase;
GetCardResponseEntity? cartDetails ;
late String productid ;
  Future<bool> getCart( )async{
    emit(GetCardLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error){
      emit(GetCardErrorState(error.errorMessage));
    }, (cartResponse){
      cartDetails = cartResponse;
      emit(GetCardSuccessState(cartResponse));
      return true;
    });
    return false;
  }
  Future<bool> updateProductCount({ required String productID , required String newCount})async{
    productid = productID ;
   emit(UpdateProductCountState(productID));
    var either = await updateCartProductCountUseCase.invoke(newCount, productID);
    either.fold((error){
      emit(GetCardErrorState(error.errorMessage));
    }, (cartResponse){
      cartDetails = cartResponse;
      emit(GetCardSuccessState(cartResponse));
      return true;
    });
    return false;
  }
}