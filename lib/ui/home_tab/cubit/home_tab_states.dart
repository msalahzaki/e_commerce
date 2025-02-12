import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';



class HomeTabStates {}

class CategoriesLoadingState extends  HomeTabStates{}
class CategoriesInitialState extends  HomeTabStates{}
class  CategoriesErrorState extends  HomeTabStates{
  String errorMassage;
  CategoriesErrorState(this.errorMassage);
}
class  CategoriesSuccessState extends HomeTabStates{
  AllCategoriesEntity allCategoriesEntity;

  CategoriesSuccessState(this.allCategoriesEntity);
}

class ProductLoadingState extends  HomeTabStates{}
class ProductInitialState extends  HomeTabStates{}
class  ProductErrorState extends  HomeTabStates{
  String errorMassage;
  ProductErrorState(this.errorMassage);
}
class  ProductSuccessState extends HomeTabStates{
  List<AllProductEntity> allProductEntity;

  ProductSuccessState(this.allProductEntity);
}