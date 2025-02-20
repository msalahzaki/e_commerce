import 'package:e_commerce/data/model/GetAllProductsModel.dart';
import 'package:e_commerce/domain/entities/productEntity.dart';

class ProductModel extends ProductEntity{
  ProductModel({
      super.data,});

  ProductModel.fromJson(dynamic json) {
    data = json['data'] != null ? ProductDataModel.fromJson(json['data']) : null;
  }




}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.reviews,
  });

  ProductDataModel.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(ProductsSubcategoryModel.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? ProductCategoryModel.fromJson(json['category'])
        : null;
    brand =
    json['brand'] != null ? ProductBrandModel.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add((v));
      });
    }
    id = json['id'];
  }
}











