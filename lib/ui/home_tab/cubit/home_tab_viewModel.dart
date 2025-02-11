import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/usecases/getAllCategories_useCase.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/ui/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewmodel extends Cubit<HomeTabStates>{
  HomeTabViewmodel( this.getAllCategoriesUseCase):super(CategoriesInitialState());

 late List<CategoryEntity> categories ;
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
 getAllCategories() async{
   emit(CategoriesLoadingState());
   var either = await getAllCategoriesUseCase.invoke();
   either.fold((error){
     emit(CategoriesErrorState(error.errorMessage));
   }, (categoryResponse){
     categories = categoryResponse.categoryEntity!;
     emit(CategoriesSuccessState(categoryResponse));
   });

 }

}