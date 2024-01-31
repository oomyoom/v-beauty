part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileLoad extends ProfileEvent {}
class ProfileEdit extends ProfileEvent {}

class UpdatePersonalEvent extends ProfileEvent {
  final Personal newPersonal;

  UpdatePersonalEvent(this.newPersonal);

  @override
  List<Object> get props => [newPersonal];
}

class UpdateContactEvent extends ProfileEvent {
  final Contact newContact;

  UpdateContactEvent(this.newContact);

  @override
  List<Object> get props => [newContact];
}

class UpdateDeliveryEvent extends ProfileEvent {
  final Delivery newDelivery;

  UpdateDeliveryEvent(this.newDelivery);

  @override
  List<Object> get props => [newDelivery];
}
