import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:v_beauty/models/product_data.dart';
import 'package:v_beauty/repositories/product_api_repo.dart';

part 'homeproduct_event.dart';
part 'homeproduct_state.dart';

class HomeproductBloc extends Bloc<HomeproductEvent, HomeproductState> {
  final AllProductRepository _allproductRepository;
  HomeproductBloc(this._allproductRepository)
      : super(HomeproductLoadingState()) {
    on<LoadHomeproduct>((event, emit) async {
      emit(HomeproductLoadingState());
      try {
        final products = await _allproductRepository.fetchProducts();
        final eyeMakeupProducts = products
            .where((product) => product.categoryName == 'Eye Makeup')
            .toList();
        final faceMakeupProducts = products
            .where((product) => product.categoryName == 'Face Makeup')
            .toList();
        final lipMakeupProducts = products
            .where((product) => product.categoryName == 'Lip Makeup')
            .toList();
        final skineCareMakeupProducts = products
            .where((product) => product.categoryName == 'Skincare Makeup')
            .toList();
        final menMakeupProducts = products
            .where((product) => product.categoryName == "Men's Makeup")
            .toList();

        emit(HomeproductLoadedState(
          allProducts: products,
          faceMakeup: faceMakeupProducts,
          eyeMakeup: eyeMakeupProducts,
          lipMakeup: lipMakeupProducts,
          skinCare: skineCareMakeupProducts,
          menMakeup: menMakeupProducts,
        ));
      } catch (e) {
        emit(HomeproductErrorState(e.toString()));
      }
    });
  }
}

// Face Makeup
// Eye Makeup
// Lip Makeup
// Skincare Makeup
// Men's Makeup
