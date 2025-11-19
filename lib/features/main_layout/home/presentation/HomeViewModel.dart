import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/useCase/GetBrandsUsecase.dart';
import 'package:ecommerce_app/domain/useCase/GetCategoriesUsecase.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeState.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;

  HomeViewModel(this.categoriesUseCase,this.brandsUseCase);// di
  HomeState state = HomeState(
    brandsState: InitialState(),
    categoriesState: InitialState(),
  );
  // constructor injection

  void loadHomeScreen(){
    _getCategories();
    _getBrands();
  }
  void _getCategories()async{
    // library to inject dependancies -> boiler plate code
    sendState(
        state.copyWith(categoriesState: LoadingState())
    );
    var response = await categoriesUseCase.getCategories();
    switch(response){
      case Failure():{
        sendState(
            state.copyWith(
                categoriesState: ErrorState(response.exception)
            )
        );
      }
      case Success():{
        sendState(
            state.copyWith(categoriesState: SuccessState(response.data))
        );
      }
    }
  }
  void _getBrands()async{
    // library to inject dependancies -> boiler plate code
    sendState(state.copyWith(
      brandsState: LoadingState()
    ));
    var response = await brandsUseCase.getBrands();
    switch(response){
      case Failure():{
        sendState(state.copyWith(
          brandsState: ErrorState(response.exception))
        );
      }
      case Success():{
        sendState(state.copyWith(
          brandsState: SuccessState(response.data))
        );
      }
    }

  }

  void sendState(HomeState newState){
    state = newState;
    notifyListeners();
  }
}