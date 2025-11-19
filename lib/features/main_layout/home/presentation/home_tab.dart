import 'dart:async';
import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeState.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/HomeViewModel.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Manual Di injection
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();


  @override
  void initState() {
    super.initState();
    homeViewModel.loadHomeScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAdsWidget(
            adsImages: adsImages,
          ),
          BlocProvider.value(
            value: homeViewModel,
            child: Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                SizedBox(
                  height: 270.h,
                  child: BlocBuilder<HomeViewModel,HomeState>(
                    buildWhen: (previous, current) {
                      return previous.categoriesState != current.categoriesState;
                    },
                    builder: (context, state) {
                      print("rebuilding Categories Widget");
                      var categoriesState = state.categoriesState;
                      switch (categoriesState) {
                        case InitialState():
                        case LoadingState():
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        case ErrorState():
                          {
                            return Text(categoriesState.exception.toString());
                          }
                        case SuccessState():
                          {
                            var categories = categoriesState.data;
                            return GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomCategoryWidget(categories[index]);
                              },
                              itemCount: categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                            );
                          }
                      }
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                SizedBox(
                  height: 270.h,
                  child: BlocBuilder<HomeViewModel,HomeState>(
                    buildWhen: (previous, current) {
                      return previous.brandsState != current.brandsState;
                    },
                    builder: (context, state) {
                      print("rebuilding brands Widget");
                      var brandsState = state.brandsState;
                       switch(brandsState) {
                        case InitialState():
                        case LoadingState():
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        case ErrorState():{
                          return Text(brandsState.exception?.toString() ??"");
                        }
                        case SuccessState():{
                          var brands = brandsState.data;
                          return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomBrandWidget(brands[index]);
                            },
                            itemCount: brands.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                CustomSectionBar(
                  sectionNname: 'Most Selling Products',
                  function: () {},
                ),
                SizedBox(
                  child: SizedBox(
                    height: 360.h,
                    child: BlocBuilder<HomeViewModel,HomeState>(
                      buildWhen: (previous, current) {
                        return previous.productsState != current.productsState;
                      },
                      builder: (buildContext,state) {
                        var productsState = state.productsState;
                        switch(productsState){
                          case InitialState():
                          case LoadingState():{
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          case ErrorState():{
                            return Text(productsState.exception.toString());
                          }
                          case SuccessState():{
                            var products = productsState.data;
                            print("products : ${products.length}");
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                product: products[index],
                                );
                              },
                              itemCount: products.length,
                            );
                          }
                        }

                      }
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
