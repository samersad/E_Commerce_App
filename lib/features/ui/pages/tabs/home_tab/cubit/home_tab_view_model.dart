import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exception/app_exceptions.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../domain/use_cases/get_all_gategories_use_case.dart';
import 'home_tab_states.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  HomeTabViewModel({required this.getAllCategoriesUseCase}):super(HomeTabInitialState());
  //todo hold data and handel logic

  final List<String> pannersList = [
    AppAssets.paner1,
    AppAssets.paner2,
    AppAssets.paner3,
  ];
  int currentIndex = 0;


  Future<void> getCategories() async {
    try {
      emit(CategoriesLoadingState());
    var categoriesList=await getAllCategoriesUseCase.invoke();
     print(categoriesList);
      emit(CategoriesSuccessState(categoriesList: categoriesList));

    }on AppExceptions
    catch(e){
      emit(CategoriesErrorState(message: e.message));
    }
  }
  void changeSelectedIndex(int  index){
  emit(ChangeSelectedIndexState());
  currentIndex = index;

}
}
