
import 'package:e_commerce_app/domain/entities/response/category/category.dart';
import 'package:e_commerce_app/domain/entities/response/category/category_response.dart';

abstract class HomeTabStates {}
class HomeTabInitialState extends HomeTabStates{}
//class ChangeSelectedIndexState extends HomeTabStates{}
class CategoriesLoadingState extends HomeTabStates{}
class CategoriesErrorState extends HomeTabStates{
  String message;
  CategoriesErrorState({required this.message});
}
class CategoriesSuccessState extends HomeTabStates{
 List<Category>? categoriesList;
  CategoriesSuccessState({required this.categoriesList});
}
class ChangeSelectedIndexState extends HomeTabStates{}


