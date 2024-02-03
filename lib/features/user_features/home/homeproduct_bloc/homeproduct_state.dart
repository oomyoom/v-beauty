part of 'homeproduct_bloc.dart';

@immutable
abstract class HomeproductState extends Equatable {}

class HomeproductLoadingState extends HomeproductState {
  @override
  List<Object?> get props => [];
}

class HomeproductLoadedState extends HomeproductState {
  final List<ProductModal> allProducts;
  final List<ProductModal> faceMakeup;
  final List<ProductModal> eyeMakeup;
  final List<ProductModal> lipMakeup;
  final List<ProductModal> skinCare;
  final List<ProductModal> menMakeup;
  
  HomeproductLoadedState( {required this.allProducts,required this.faceMakeup,required this.eyeMakeup,required this.lipMakeup,required this.skinCare,required this.menMakeup});

  @override
  List<Object> get props => [allProducts, faceMakeup, eyeMakeup, lipMakeup, skinCare, menMakeup];
}

class HomeproductErrorState extends HomeproductState {
  final String error;
  HomeproductErrorState(this.error);

  @override
  List<Object> get props => [error];
}


// Face Makeup
// Eye Makeup
// Lip Makeup
// Skincare Makeup
// Men's Makeup
