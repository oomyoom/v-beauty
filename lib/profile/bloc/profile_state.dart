part of 'profile_bloc.dart';

class ProfileState {
  final Personal personal;
  final Contact contact;
  final Delivery delivery;

  ProfileState(this.personal, this.contact, this.delivery);
}

class ProfileInitial extends ProfileState {
  ProfileInitial(super.personal, super.contact, super.delivery);
}

class ProfileUpdatedState extends ProfileState {
  ProfileUpdatedState(super.personal, super.contact, super.delivery);
}