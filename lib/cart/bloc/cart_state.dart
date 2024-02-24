part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItem> cartItems;
  final int paymentId;

  const CartState({this.cartItems = const [], this.paymentId = 1});

  @override
  List<Object> get props => [cartItems];
}
