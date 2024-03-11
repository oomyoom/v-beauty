part of 'rating_bloc.dart';

abstract class StarRatingState extends Equatable {
  const StarRatingState();
  
  @override
  List<Object> get props => [];
}

class StarRatingInitial extends StarRatingState {}

class StarRatingUpdated extends StarRatingState {
  final int rating;

  const StarRatingUpdated(this.rating);

  @override
  List<Object> get props => [rating];
}