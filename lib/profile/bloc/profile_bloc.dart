import 'package:bloc/bloc.dart';
import 'package:v_beauty/profile/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileInitial(
            Personal(
                firstName: 'TANAKORNS',
                lastName: 'TOSANGUAN',
                gender: 'ชาย',
                birthday: 'DD/MM/YYYY'),
            Contact(email: 'oomyoom@xxx.com', tel: '0900000000'),
            Delivery(
                provider: 'provider',
                address: 'address',
                zipcode: 'zipcode'))) {
    on<UpdatePersonalEvent>(userPersonalUpdate);
    on<UpdateContactEvent>(userContactUpdate);
    on<UpdateDeliveryEvent>(userDeliveryUpdate);
  }

  void userPersonalUpdate(
      UpdatePersonalEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdatedState(event.newPersonal, state.contact, state.delivery));
  }

  void userContactUpdate(UpdateContactEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdatedState(state.personal, event.newContact, state.delivery));
  }

  void userDeliveryUpdate(
      UpdateDeliveryEvent event, Emitter<ProfileState> emit) {
    emit(ProfileUpdatedState(state.personal, state.contact, event.newDelivery));
  }
}
