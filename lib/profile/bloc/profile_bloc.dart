import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_beauty/profile/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ImagePicker _picker = ImagePicker();

  UserProfile profile = UserProfile(
      image: null,
      personal: Personal(
          firstName: 'TANAKORN',
          lastName: 'TOSANGUAN',
          gender: 'ชาย',
          birthday: 'YYYY-MM-DD'),
      contact: Contact(email: 'oomyoom@xxx.com', tel: '0900000000'),
      delivery: Delivery(
          provider: 'PROVIDER',
          address: 'ADDRESS',
          zipcode: 'ZIPCODE')); // Mock initial profile

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoad>((event, emit) async {
      emit(ProfileLoaded(profile));
    });
    on<UpdatePersonalEvent>((event, emit) async {
      profile = UserProfile(
          image: null,
          personal: event.newPersonal,
          contact: profile.contact,
          delivery: profile.delivery);
      emit(ProfileUpdated(profile));
    });
    on<UpdateContactEvent>((event, emit) async {
      profile = UserProfile(
          image: null,
          personal: profile.personal,
          contact: event.newContact,
          delivery: profile.delivery);
      emit(ProfileUpdated(profile));
    });
    on<UpdateDeliveryEvent>((event, emit) async {
      profile = UserProfile(
          image: null,
          personal: profile.personal,
          contact: profile.contact,
          delivery: event.newDelivery);
      emit(ProfileUpdated(profile));
    });
    on<ProfileEdit>((event, emit) async {
      emit(ProfileLoaded(profile));
    });
    on<ProfilePickImage>((event, emit) async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final CroppedFile? croppedImage = await ImageCropper().cropImage(
            sourcePath: image.path,
            cropStyle: CropStyle.circle, // Set crop style to circle
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: const Color(0xFFE5C1C5),
                toolbarWidgetColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: true, // Lock the aspect ratio for circle
              ),
              IOSUiSettings(
                minimumAspectRatio: 1.0,
                aspectRatioLockEnabled:
                    true, // Lock the aspect ratio for circle
              ),
            ]);
        if (croppedImage != null) {
          profile = UserProfile(
              image: File(croppedImage.path),
              personal: profile.personal,
              contact: profile.contact,
              delivery: profile.delivery);
          emit(ProfileLoaded(profile));
        }
      }
    });
  }
}
