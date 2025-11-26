
import 'package:e_commerce_app/domain/entities/response/product/product.dart';

import '../common/metadata.dart';

class ProductResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductResponse ({
    this.results,
    this.metadata,
    this.data,
  });


}




