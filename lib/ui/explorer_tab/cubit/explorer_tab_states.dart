import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';



class ExplorerTabStates {}

class ProductsLoadingState extends  ExplorerTabStates{}
class ProductsInitialState extends  ExplorerTabStates{}
class  ProductsErrorState extends  ExplorerTabStates{
  String errorMassage;
  ProductsErrorState(this.errorMassage);
}
class  ProductsSuccessState extends ExplorerTabStates{
  List<AllProductEntity> allProductEntity;

  ProductsSuccessState(this.allProductEntity);
}
