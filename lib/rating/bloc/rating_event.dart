part of 'rating_bloc.dart';

abstract class StarRatingEvent extends Equatable {
  const StarRatingEvent();

  @override
  List<Object> get props => [];
}

class StarRatingChanged extends StarRatingEvent {
  final int rating;

  const StarRatingChanged(this.rating);

  @override
  List<Object> get props => [rating];
}
