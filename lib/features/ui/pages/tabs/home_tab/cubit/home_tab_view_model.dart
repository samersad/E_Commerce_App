import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../domain/use_cases/get_all_gategories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());

  //todo hold data and handel logic
  final List<String> pannersList = [
    AppAssets.paner1,
    AppAssets.paner2,
    AppAssets.paner3,
  ];
  int currentIndex = 0;

  Future<void> getCategories() async {
    try {
      emit(CategoriesOrBrandsLoadingState());
      var categoriesList = await getAllCategoriesUseCase.invoke();
      print(categoriesList);
      emit(CategoriesSuccessState(categoriesList: categoriesList));
    } on AppExceptions catch (e) {
      emit(CategoriesOrBrandsErrorState(message: e.message));
    }
  }

  Future<void> getBrands() async {
    try {
      emit(CategoriesOrBrandsLoadingState());
      var brandsList = await getAllBrandsUseCase.invoke();
      print(brandsList);
      emit(BrandsSuccessState(brandsList: brandsList));
    } on AppExceptions catch (e) {
      emit(CategoriesOrBrandsErrorState(message: e.message));
    }
  }

  void changeSelectedIndex(int index) {
    currentIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
