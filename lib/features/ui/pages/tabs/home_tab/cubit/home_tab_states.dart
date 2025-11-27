
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:e_commerce_app/domain/entities/response/category/category_response.dart';

abstract class HomeTabStates {}
class HomeTabInitialState extends HomeTabStates{}
class ChangeSelectedIndexState extends HomeTabStates{}
class CategoriesOrBrandsLoadingState extends HomeTabStates{}
class CategoriesOrBrandsErrorState extends HomeTabStates{
  String message;
  CategoriesOrBrandsErrorState({required this.message});
}
class CategoriesSuccessState extends HomeTabStates{
 List<CategoryOrBrands>? categoriesList;
  CategoriesSuccessState({required this.categoriesList});
}
class BrandsSuccessState extends HomeTabStates{
 List<CategoryOrBrands>? brandsList;
 BrandsSuccessState({required this.brandsList});
}


