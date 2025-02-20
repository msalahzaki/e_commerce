import 'dart:math';

import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/domain/usecases/getAllCategories_useCase.dart';
import 'package:e_commerce/domain/usecases/getAllProducts_useCase.dart';
import 'package:e_commerce/domain/usecases/getProductsByCategory_useCase.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce/ui/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewmodel extends Cubit<HomeTabStates>{
  HomeTabViewmodel( this.getAllCategoriesUseCase,this.getAllProductsUseCase):super(CategoriesInitialState());
  late int randomNumber;
  late List<CategoryEntity> categories ;
 late List<AllProductEntity> allProduct ;
 late CategoryEntity randomCategoryEntity;

  final Random random = Random();
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
  GetProductsByCategoryUseCase getAllProductsUseCase  ;

 getAllCategories() async{
   emit(CategoriesLoadingState());
   var either = await getAllCategoriesUseCase.invoke();
   either.fold((error){
     emit(CategoriesErrorState(error.errorMessage));
   }, (categoryResponse){
     categories = categoryResponse.categoryEntity!;
       randomNumber = random.nextInt(categories.length);
     randomCategoryEntity= categories[randomNumber];
          emit(CategoriesSuccessState(categoryResponse));
     getAllProductsByCategoryID();
   });

 }

 getAllProductsByCategoryID({String? categoryID}) async{

categoryID ??= randomCategoryEntity.id;

   emit(ProductLoadingState());
   var either = await getAllProductsUseCase.invoke(randomCategoryEntity.id!);
   either.fold((error){
     emit(ProductErrorState(error.errorMessage));
   }, (productResponse){
     allProduct = productResponse.allProductEntity!;
     emit(ProductSuccessState(allProduct));
   });

 }

}