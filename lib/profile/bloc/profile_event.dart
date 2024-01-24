part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadProfileEvent extends ProfileEvent {}

class UpdatePersonalEvent extends ProfileEvent {
  final Personal newPersonal;

  UpdatePersonalEvent({required this.newPersonal});
}

class UpdateContactEvent extends ProfileEvent {
  final Contact newContact;

  UpdateContactEvent({required this.newContact});
}

class UpdateDeliveryEvent extends ProfileEvent {
  final Delivery newDelivery;

  UpdateDeliveryEvent({required this.newDelivery});
}
