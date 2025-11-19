import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  ComponentState<List<Brand>> brandsState;
  ComponentState<List<Category>> categoriesState;
  ComponentState<List<Product>> productsState;

  @override
  List<Object?> get props => [brandsState,categoriesState,productsState];
  HomeState({
    required this.brandsState,
    required this.categoriesState,
    required this.productsState,
});

  HomeState copyWith({
    ComponentState<List<Brand>>? brandsState,
    ComponentState<List<Category>>? categoriesState,
    ComponentState<List<Product>>? productsState,
  }){
    return HomeState(
      brandsState: brandsState ?? this.brandsState,
      categoriesState: categoriesState ?? this.categoriesState,
      productsState: productsState ?? this.productsState,
    );
  }
}