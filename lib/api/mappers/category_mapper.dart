import 'package:e_commerce_app/api/model/response/category/category_dto.dart';

import '../../domain/entities/response/category/category.dart';

extension CategoryMapper on CategoryDto{
  Category toCategory(){
    return Category(
      name: name,
      image: image,
      id: id,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt
    );
  }
}