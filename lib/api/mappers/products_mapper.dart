import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/api/mappers/sub_category_mapper.dart';
import 'package:e_commerce_app/api/model/products/product_dto.dart';
import 'package:e_commerce_app/api/model/response/common/category_or_brands_dto.dart';

import '../../domain/entities/response/common/category_or_brands.dart';
import '../../domain/entities/response/product/product.dart';

extension ProductsMapper on ProductDto{
  Product toProduct(){
    return Product(
      id: id,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt,
      description: description,
      title: title,
      brand: brand!.toCategoryOrBrands(),
      category: category!.toCategoryOrBrands(),
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory:subcategory?.map(
        (subDo) =>subDo.toSubCategory() ,
      ).toList()
    );
  }
}