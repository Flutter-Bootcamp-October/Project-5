import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/screens/profile/exports.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitial());

  getAboutDataCubit() async {
    AboutModel skillsModel = await getAboutApi();
    emit(AboutGetDataState(aboutModel: skillsModel));
  }

  changeImageCubit() async {
    Uint8List? bytes;
    // Future _updateImgWidget() async {
    //   isLoading = false;
    //   setState(() {});
    final ImagePicker _picker = ImagePicker();
    const source = ImageSource.gallery;
    File? filePath;
    XFile? file = await _picker.pickImage(source: source);
    if (file == null) {
      // customSnackBar(
      //     context: context, message: "No Image was selected");
      emit(AboutErrorState());
    } else {
      emit(AboutChangeImageState());
      filePath = File(file.path);
      imageCache.clear();
      uploadAboutImageApi(image: filePath);
      // await _updateImgWidget(url: aboutModel.data!.image);
      // setState(() {});
    }
    bytes = null;
    await Future.delayed(
      const Duration(seconds: 3),
      () async {
        // bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        //     .buffer
        //     .asUint8List();
      },
    ).then((value) {
      // _pic = MemoryImage(bytes!);
      // isLoading = true;
      // setState(() {});
      // emit(AboutChangeImageState());
      getAboutDataCubit();
    });
    // }
  }

  changeBioCubit({
    required String name,
    required String position,
    required String phone,
    required String location,
    required String birthday,
    required String bio,
  }) {
    putDataAboutApi(
            name: name,
            titlePosition: position,
            phone: phone,
            location: location,
            birthday: birthday,
            about: bio)
        .then(
      (value) {
        // Navigator.pop(context);
        // widget.updateAboutData!.call();
        // setState(() {});
        emit(AboutChangeBioState());
        getAboutDataCubit();
      },
    );
  }

  aboutRefreshCubit() async {
    emit(AboutRefreshState());
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    ).then((value) {
      getAboutDataCubit();
    });
  }
}
