import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class StarRatingBloc extends Bloc<StarRatingEvent, StarRatingState> {
  StarRatingBloc() : super(StarRatingInitial()) {
    on<StarRatingChanged>((event, emit) {
      emit(StarRatingUpdated(event.rating));
    });
  }
}
