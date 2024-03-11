import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  RepositoriesBloc() : super(RepositoriesInitial()) {
    on<RepositoriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
