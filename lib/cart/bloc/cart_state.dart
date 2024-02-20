part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItem> cartItems;

  const CartState({this.cartItems = const []});

  @override
  List<Object> get props => [cartItems];
}
