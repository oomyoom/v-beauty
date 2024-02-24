part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  final ProductModal productItem;

  CartItemAdded(this.productItem);

  @override
  List<Object> get props => [productItem];
}

class CartItemRemoved extends CartEvent {
  final int productId;

  CartItemRemoved(this.productId);

  @override
  List<Object> get props => [productId];
}

class CartItemQuantityChanged extends CartEvent {
  final int productId;
  final int quantity;

  CartItemQuantityChanged(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}

class CartPayment extends CartEvent {
  final int paymentId;

  CartPayment(this.paymentId);

  @override
  List<Object> get props => [paymentId];
}

class CartCleared extends CartEvent {}
