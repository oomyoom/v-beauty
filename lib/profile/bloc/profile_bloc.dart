import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_beauty/profile/models/user.dart';
import 'package:v_beauty/profile/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final ImagePicker _picker = ImagePicker();

  // UserProfile profile = UserProfile(
  //     image: null,
  //     personal: Personal(
  //         firstName: 'TANAKORN',
  //         lastName: 'TOSANGUAN',
  //         gender: 'ชาย',
  //         birthday: 'YYYY-MM-DD'),
  //     contact: Contact(email: 'oomyoom@xxx.com', tel: '0900000000'),
  //     delivery: Delivery(
  //         provider: 'PROVIDER',
  //         address: 'ADDRESS',
  //         zipcode: '11111')); // Mock initial profile

  ProfileBloc({required this.userRepository}) : super(ProfileInitial()) {
    on<ProfileLoad>((event, emit) async {
      emit(ProfileLoading()); // แสดงสถานะการโหลด
      try {
        final profile = await userRepository.getUser();
        emit(ProfileLoaded(profile)); // โหลดสำเร็จ, ส่งข้อมูล profile
      } catch (error) {
        emit(ProfileError(error.toString())); // มีข้อผิดพลาดเกิดขึ้น
      }
    });
    on<UpdatePersonalEvent>((event, emit) async {
      await userRepository.updatePersonalInfo(event.newPersonal);
      final updatedProfile = await userRepository.getUser();
      emit(ProfileUpdated(updatedProfile));
    });
    on<UpdateContactEvent>((event, emit) async {
      await userRepository.updateContactInfo(event.newContact);
      final updatedProfile = await userRepository.getUser();
      emit(ProfileUpdated(updatedProfile));
    });
    on<UpdateDeliveryEvent>((event, emit) async {
      await userRepository.updateDeliveryInfo(event.newDelivery);
      final updatedProfile = await userRepository.getUser();
      emit(ProfileUpdated(updatedProfile));
    });
    on<ProfileEdit>((event, emit) async {
      emit(ProfileLoading()); // แสดงสถานะการโหลด
      try {
        final profile = await userRepository.getUser();
        emit(ProfileLoaded(profile)); // โหลดสำเร็จ, ส่งข้อมูล profile
      } catch (error) {
        emit(ProfileError(error.toString())); // มีข้อผิดพลาดเกิดขึ้น
      }
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
          // อัปโหลดรูปภาพไปยัง server หรือ storage
          await userRepository.uploadImage(File(croppedImage.path));
          // ดึง profile อัปเดตล่าสุดหลังจากการเปลี่ยนแปลง
          final updatedProfile = await userRepository.getUser();
          emit(ProfileLoaded(updatedProfile));
          // profile = UserProfile(
          //     image: File(croppedImage.path),
          //     personal: profile.personal,
          //     contact: profile.contact,
          //     delivery: profile.delivery);
          // emit(ProfileLoaded(profile));
        }
      }
    });
  }
}
