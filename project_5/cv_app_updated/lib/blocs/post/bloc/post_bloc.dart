import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/global/globally.dart';
import 'package:project_5/screens/home/home_screen.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitialState()) {
    on<PostUpdateEvent>((event, emit) async {
      try {
        final element = await addMethods.addAboutMethod(body: {
          "name": event.user,
          "title_position": event.title,
          "phone": event.phone,
          "location": event.location,
          "birthday": event.birthday,
          "about": event.about,
        }, context: event.context);
        aboutList.add(element);
        emit(PostAboutState());
      } on FormatException catch (error) {
        emit(PostErrorState(message: error.message.toString()));
      }
    });
    on<PostImageEvent>((event, emit) {
      File? selectedImage;

      Future chooseImage() async {
        final picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          selectedImage = File(image.path);
          emit(UpdateImageState(newSelectedImage: selectedImage));
        }
      }

      chooseImage;
    });
    on<PostSkillEvent>((event, emit) async {
      if (event.skill.isNotEmpty) {
        try {
          final element = await addMethods.addSkillMethod(body: {
            "skill": event.skill,
          }, context: event.context);
          skillList.add(element);
          emit(PostSkillState());
        } on FormatException catch (error) {
          emit(PostErrorState(message: error.message.toString()));
        }
      } else {
        emit(PostErrorState(message: "please enter skill"));
      }
    });
    on<PostEducationEvent>((event, emit) async {
      if (event.university.isNotEmpty &&
          event.college.isNotEmpty &&
          event.specialization.isNotEmpty) {
        try {
          final element = await addMethods.addEducationMethod(body: {
            "university": event.university,
            "college": event.college,
            "specialization": event.specialization,
            "level": event.level,
            "graduation_date": event.graduationDate,
          }, context: event.context);
          educationList.add(element);
          print("education added to list");
          emit(PostEducationState());
        } on FormatException catch (error) {
          print("error");
          emit(PostErrorState(message: error.message.toString()));
        }
      } else {
        emit(PostErrorState(message: "Please fill all the fields"));
      }
    });
    on<PostProjectEvent>((event, emit) async {
      if (event.projectName.isNotEmpty &&
          event.projectDescription.isNotEmpty &&
          event.projectState.isNotEmpty) {
        try {
          final element = await addMethods.addProjectMethod(body: {
            "name": event.projectName,
            "description": event.projectDescription,
            "state": event.projectState,
          }, context: event.context);
          projectList.add(element);
          emit(PostProjectState());
          print("added to list");
        } on FormatException catch (error) {
          print("error");
          emit(PostErrorState(message: error.message.toString()));
        }
      } else {
        emit(PostErrorState(message: "please fill all the fields"));
      }
    });
    on<PostSocialEvent>((event, emit) async {
      if (event.username.isNotEmpty) {
        try {
          final element = await addMethods.addSocialMethod(body: {
            "username": event.username,
            "social": event.social,
          }, context: event.context);
          socialList.add(element);
          emit(PostSocialState());
        } on FormatException catch (error) {
          print("error");
          emit(PostErrorState(message: error.message.toString()));
        }
      } else {
        emit(PostErrorState(message: "please enter username"));
      }
    });
  }
}
