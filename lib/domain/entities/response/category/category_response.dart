

import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';

import '../common/metadata.dart';

class CategoryResponse {
  final int? results;
  final Metadata? metadata;
  final List<CategoryOrBrands>? data;

  CategoryResponse ({
    this.results,
    this.metadata,
    this.data,
  });




}






