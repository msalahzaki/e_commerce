import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';

class GetWishListResponseEntity {
  GetWishListResponseEntity({
      this.status, 
      this.statusMsg, 
      this.count, 
      this.products,
    this.message
  });


  String? status;
  String? statusMsg;
  num? count;
  List<WishListDataEntity>? products;
  String? message ;



}

class WishListDataEntity {
  WishListDataEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      });


  num? sold;
  List<String>? images;
  List<ProductSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  ProductBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;


}
