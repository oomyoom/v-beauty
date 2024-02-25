import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v_beauty/order_history/models/order.dart';
import 'package:v_beauty/order_history/repositories/order_repo.dart';
import 'package:v_beauty/utils/token_management.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  OrderBloc({required this.orderRepository}) : super(const OrderState()) {
    on<LoadOrder>((event, emit) async {
      if (await _checkAndHandleTokenExpiration(emit)) return;

      final order = await orderRepository.getOrder();
      emit(OrderState(orderItems: order));
    });
  }

  Future<bool> _checkAndHandleTokenExpiration(Emitter<OrderState> emit) async {
    if (await checkTokenExpiration()) {
      emit(Unauthenticated());
      return true;
    }
    return false;
  }
}
