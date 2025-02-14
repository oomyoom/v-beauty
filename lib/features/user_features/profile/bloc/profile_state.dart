part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile profile;

  ProfileLoaded(this.profile);

  @override
  List<Object> get props => [profile];
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);

  @override
  List<Object> get props => [error];
}

class ProfileUpdated extends ProfileState {}

class Unauthenticated extends ProfileState {}
