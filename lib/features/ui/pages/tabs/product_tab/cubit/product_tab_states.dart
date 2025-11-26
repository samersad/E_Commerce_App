import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';

import '../../../../../../domain/entities/response/product/product.dart';

abstract class ProductTabStates {}
// class ProductTabInitialState extends ProductTabStates{}
class ProductTabLoadingState extends ProductTabStates{}
class ProductTabErrorState extends ProductTabStates{
  String message;
  ProductTabErrorState({required this.message});
}
class ProductTabSuccessState extends ProductTabStates{
  List<Product>? productsList;
  ProductTabSuccessState({required this.productsList});
}




