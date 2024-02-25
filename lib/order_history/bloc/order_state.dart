part of 'order_bloc.dart';

class OrderState extends Equatable {
  final List<Order> orderItems;

  const OrderState({this.orderItems = const []});

  @override
  List<Object> get props => [orderItems];
}

class Unauthenticated extends OrderState {}
