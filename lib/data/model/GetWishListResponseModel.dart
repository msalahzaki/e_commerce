import 'package:e_commerce/data/model/AllCategoriesResponseModel.dart';
import 'package:e_commerce/data/model/GetAllProductsModel.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';

class GetWishListResponseModel extends GetWishListResponseEntity{
  GetWishListResponseModel({
      super.status,
    super.count,
    super.statusMsg,
    super.products,
    super.message

  });

  GetWishListResponseModel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(WishListDataModel.fromJson(v));
      });
    }
  }




}

class WishListDataModel extends WishListDataEntity {
  WishListDataModel({
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
  });

  WishListDataModel.fromJson(dynamic json) {
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
    category =
    json['category'] != null ? CategoryResponseModel.fromJson(json['category']) : null;
    brand = json['brand'] != null ? ProductBrandModel.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }

}
