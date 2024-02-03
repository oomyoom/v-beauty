part of 'homeproduct_bloc.dart';


abstract class HomeproductEvent extends Equatable {
  const HomeproductEvent();
}



class LoadHomeproduct extends HomeproductEvent {
  @override
  List<Object> get props => [];
}