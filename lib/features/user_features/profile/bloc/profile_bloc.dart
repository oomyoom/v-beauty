import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_beauty/features/user_features/profile/models/user.dart';
import 'package:v_beauty/features/user_features/profile/repositories/user_repository.dart';
import 'package:v_beauty/utils/token_management.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final ImagePicker _picker = ImagePicker();

  ProfileBloc({required this.userRepository}) : super(ProfileInitial()) {
    on<ProfileLoad>(_onProfileLoad);
    on<UpdatePersonalEvent>(_onEventWithTokenCheck);
    on<UpdateContactEvent>(_onEventWithTokenCheck);
    on<UpdateDeliveryEvent>(_onEventWithTokenCheck);
    on<ProfileEdit>(_onProfileEdit);
    on<ProfilePickImage>(_onProfilePickImage);
  }

  Future<void> _onProfileLoad(
      ProfileLoad event, Emitter<ProfileState> emit) async {
    await _loadAndUpdateProfile(emit);
  }

  Future<void> _onEventWithTokenCheck(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    if (await _checkAndHandleTokenExpiration(emit)) return;

    try {
      if (event is UpdatePersonalEvent) {
        await userRepository.updatePersonalInfo(event.newPersonal);
      } else if (event is UpdateContactEvent) {
        await userRepository.updateContactInfo(event.newContact);
      } else if (event is UpdateDeliveryEvent) {
        await userRepository.updateDeliveryInfo(event.newDelivery);
      }
      emit(ProfileUpdated());
    } catch (error) {
      emit(ProfileError(error.toString()));
    }
  }

  Future<void> _onProfileEdit(
      ProfileEdit event, Emitter<ProfileState> emit) async {
    await _loadAndUpdateProfile(emit);
  }

  Future<void> _onProfilePickImage(
      ProfilePickImage event, Emitter<ProfileState> emit) async {
    if (await _checkAndHandleTokenExpiration(emit)) return;

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final CroppedFile? croppedImage = await _cropImage(image.path);
      if (croppedImage != null) {
        try {
          await userRepository.uploadImage(File(croppedImage.path));
          emit(ProfileUpdated());
        } catch (error) {
          emit(ProfileError(error.toString()));
        }
      }
    }
  }

  Future<CroppedFile?> _cropImage(String imagePath) async {
    return await ImageCropper().cropImage(
        sourcePath: imagePath,
        cropStyle: CropStyle.circle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: const Color(0xFFE5C1C5),
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioLockEnabled: true,
          ),
        ]);
  }

  Future<void> _loadAndUpdateProfile(Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    if (await _checkAndHandleTokenExpiration(emit)) return;

    try {
      final profile = await userRepository.getUser();
      emit(ProfileLoaded(profile));
    } catch (error) {
      emit(ProfileError(error.toString()));
    }
  }

  Future<bool> _checkAndHandleTokenExpiration(
      Emitter<ProfileState> emit) async {
    if (await checkTokenExpiration()) {
      emit(Unauthenticated());
      return true;
    }
    return false;
  }
}
