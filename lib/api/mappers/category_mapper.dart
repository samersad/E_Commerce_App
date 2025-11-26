import 'package:e_commerce_app/api/model/response/common/category_or_brands_dto.dart';

import '../../domain/entities/response/common/category_or_brands.dart';

extension CategoryMapper on CategoryOrBrandsDto{
  CategoryOrBrands toCategoryOrBrands(){
    return CategoryOrBrands(
      name: name,
      image: image,
      id: id,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt
    );
  }
}