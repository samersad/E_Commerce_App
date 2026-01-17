import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/api/model/response/common/category_or_brands_dto.dart';
import 'package:e_commerce_app/domain/entities/response/product/sub_category.dart';
import '../../domain/entities/response/common/category_or_brands.dart';
import '../../domain/entities/response/product/product.dart';
import '../model/response/common/sub_category_dto.dart';

extension SubCategoryMapper on SubCategoryDto{
  SubCategory toSubCategory(){
    return SubCategory(
      id: id,
      slug: slug,
      category: category,
        name: name
    );
  }
}