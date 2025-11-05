import 'package:ecommerce_app/domain/repos/BrandsRepo.dart';
import 'package:ecommerce_app/domain/repos/CategoriesRepo.dart';
import 'package:ecommerce_app/domain/useCase/GetBrandsUsecase.dart';
import 'package:ecommerce_app/domain/useCase/GetCategoriesUsecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  HomeViewModel(this.categoriesUseCase,this.brandsUseCase);// di
  // constructor injection
  void getCategories()async{
    // library to inject dependancies -> boiler plate code
    var categories = await categoriesUseCase.getCategories();
  }
  void getBrands()async{
    // library to inject dependancies -> boiler plate code
    var brands = await brandsUseCase.getBrands();
  }
}