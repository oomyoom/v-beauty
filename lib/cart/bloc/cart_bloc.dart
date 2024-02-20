import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v_beauty/cart/models/cart.dart';
import 'package:v_beauty/models/product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartItemAdded>((event, emit) {
      final List<CartItem> updatedCartItems = List.from(state.cartItems);
      var index = updatedCartItems.indexWhere(
          (item) => item.productItem.productId == event.productItem.productId);
      if (index != -1) {
        updatedCartItems[index].quantity += 1;
      } else {
        updatedCartItems
            .add(CartItem(productItem: event.productItem, quantity: 1));
      }
      emit(CartState(cartItems: updatedCartItems));
    });

    on<CartItemRemoved>((event, emit) {
      final List<CartItem> updatedCartItems = List.from(state.cartItems)
        ..removeWhere((item) => item.productItem.productId == event.productId);
      emit(CartState(cartItems: updatedCartItems));
    });

    on<CartItemQuantityChanged>((event, emit) {
      final List<CartItem> updatedCartItems =
          List<CartItem>.from(state.cartItems);
      final itemIndex = updatedCartItems
          .indexWhere((item) => item.productItem.productId == event.productId);
      if (itemIndex != -1) {
        final item = updatedCartItems[itemIndex];
        updatedCartItems[itemIndex] =
            CartItem(productItem: item.productItem, quantity: event.quantity);
        emit(CartState(cartItems: updatedCartItems));
      }
    });

    on<CartCleared>((event, emit) {
      emit(const CartState(cartItems: []));
    });
  }
}
