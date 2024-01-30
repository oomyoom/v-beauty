import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v_beauty/profile/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserProfile profile = UserProfile(
      personal: Personal(
          firstName: 'TANAKORN',
          lastName: 'TOSANGUAN',
          gender: 'ชาย',
          birthday: 'DD/MM/YYYY'),
      contact: Contact(email: 'oomyoom@xxx.com', tel: '0900000000'),
      delivery: Delivery(
          provider: 'provider',
          address: 'address',
          zipcode: 'zipcode')); // Mock initial profile

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoad>((event, emit) async {
      emit(ProfileLoaded(profile));
    });
    on<UpdatePersonalEvent>((event, emit) async {
      profile = UserProfile(
          personal: event.newPersonal,
          contact: profile.contact,
          delivery: profile.delivery);
      emit(ProfileUpdated(profile));
    });
    on<UpdateContactEvent>((event, emit) async {
      profile = UserProfile(
          personal: profile.personal,
          contact: event.newContact,
          delivery: profile.delivery);
      emit(ProfileUpdated(profile));
    });
    on<UpdateDeliveryEvent>((event, emit) async {
      profile = UserProfile(
          personal: profile.personal,
          contact: profile.contact,
          delivery: event.newDelivery);
      emit(ProfileUpdated(profile));
    });
  }
}
