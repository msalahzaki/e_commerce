import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/domain/usecases/getAllProducts_useCase.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExplorerTabViewmodel extends Cubit<ExplorerTabStates>{
  ExplorerTabViewmodel(this.getAllProductsUseCase):super(ProductsInitialState());


 late List<AllProductEntity> allProduct ;

  GetAllProductsUseCase getAllProductsUseCase  ;

 getAllProducts() async{

   emit(ProductsLoadingState());
   var either = await getAllProductsUseCase.invoke();
   either.fold((error){
     emit(ProductsErrorState(error.errorMessage));
   }, (productResponse){
     allProduct = productResponse.allProductEntity!;
     emit(ProductsSuccessState(allProduct));
   });

 }

}