part of 'repositories_bloc.dart';

sealed class RepositoriesState extends Equatable {
  const RepositoriesState();
  
  @override
  List<Object> get props => [];
}

final class RepositoriesInitial extends RepositoriesState {}
