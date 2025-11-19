import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/SortBy.dart';
import 'package:ecommerce_app/domain/useCase/GetBrandsUsecase.dart';
import 'package:ecommerce_app/domain/useCase/GetCategoriesUsecase.dart';
import 'package:ecommerce_app/domain/useCase/GetProductsUseCase.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  GetProductsUseCase getProductsUseCase;

  HomeViewModel(this.categoriesUseCase,this.brandsUseCase,this.getProductsUseCase)
  :super(HomeState(
    brandsState: InitialState(),
    categoriesState: InitialState(),
    productsState: InitialState(),
  ));

  void loadHomeScreen(){
    _getCategories();
    _getBrands();
    _getMostSellingProducts();
  }
  void _getCategories()async{
    // library to inject dependancies -> boiler plate code
    emit(
        state.copyWith(categoriesState: LoadingState())
    );
    var response = await categoriesUseCase.getCategories();
    switch(response){
      case Failure():{
        emit(
            state.copyWith(
                categoriesState: ErrorState(response.exception)
            )
        );
      }
      case Success():{
        emit(
            state.copyWith(categoriesState: SuccessState(response.data))
        );
      }
    }
  }
  void _getBrands()async{
    // library to inject dependancies -> boiler plate code
    emit(state.copyWith(
      brandsState: LoadingState()
    ));
    var response = await brandsUseCase.getBrands();
    switch(response){
      case Failure():{
        emit(state.copyWith(
          brandsState: ErrorState(response.exception))
        );
      }
      case Success():{
        emit(state.copyWith(
          brandsState: SuccessState(response.data))
        );
      }
    }

  }

  void _getMostSellingProducts()async{
    emit(state.copyWith(
      productsState: LoadingState()
    ));
    var response = await getProductsUseCase.getProducts(
      limit: 10,sort: SortBy.MostSelling
    );
    switch(response){
    case Failure():{
      emit(state.copyWith(
        productsState: ErrorState(response.exception)
      ));
    }
    case Success():{
      emit(state.copyWith(
        productsState: SuccessState(response.data)
      ));
    }
    }
  }
}