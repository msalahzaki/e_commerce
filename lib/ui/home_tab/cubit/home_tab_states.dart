import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';



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