// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/settings/components/custom_bottom_modal_sheet.dart';
import 'package:project_5/services/about_api.dart';
import 'package:flutter/services.dart';
import 'package:project_5/theme/shimmer/shimmer_profile_header_skeleton.dart';

class ProfileUserInformation extends StatefulWidget {
  const ProfileUserInformation({
    super.key,
    this.aboutModelData,
    required this.imageUrl,
  });
  final Future? aboutModelData;
  final String imageUrl;
  @override
  State<ProfileUserInformation> createState() => _ProfileUserInformationState();
}

class _ProfileUserInformationState extends State<ProfileUserInformation> {
  String url = "";
  ImageProvider? _pic;
  bool isLoading = false;

  @override
  void initState() {
    url = widget.imageUrl;
    _pic = NetworkImage(url);
    isLoading = true;
    super.initState();
  }

  Uint8List? bytes;
  Future _updateImgWidget({required String url}) async {
    isLoading = false;
    setState(() {});
    bytes = null;
    await Future.delayed(
      const Duration(seconds: 6),
      () async {
        bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
            .buffer
            .asUint8List();
      },
    ).then((value) {
      _pic = MemoryImage(bytes!);
      isLoading = true;
      setState(() {});
    });
  }

  final ImagePicker _picker = ImagePicker();
  final source = ImageSource.gallery;
  File? filePath;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return // RefreshIndicator(
        // strokeWidth: 3,
        // onRefresh: () async {
        //   await _updateImgWidget(url: widget.imageUrl);
        //   setState(() {});
        // },
        //child:
        Column(
      // physics: const AlwaysScrollableScrollPhysics(),
      // shrinkWrap: true,
      children: [
        //TODO: REMOVE THIS FUTURE
        FutureBuilder(
          future: widget.aboutModelData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final AboutModel aboutModel = snapshot.data;
              return Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await _updateImgWidget(url: widget.imageUrl);
                        setState(() {});
                      },
                      onLongPress: () async {
                        XFile? file = await _picker.pickImage(source: source);
                        if (file == null) {
                          customSnackBar(
                              context: context,
                              message: "No Image was selected");
                        } else {
                          filePath = File(file.path);
                          imageCache.clear();
                          uploadAboutImageApi(image: filePath!);
                          await _updateImgWidget(url: aboutModel.data!.image);
                          setState(() {});
                        }
                      },
                      child: isLoading
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: _pic,
                            )
                          : const CircleAvatar(
                              radius: 50,
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${aboutModel.data?.name}  ${aboutModel.data?.titlePosition ?? ""}"),
                            Text(aboutModel.data?.about ??
                                "-You have no bio yet-"),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              //TODO:DO THIS
                              customModalBottomSheet(
                                context,
                                controller: controller,
                                content: "content",
                                onPressedFunc: () {},
                                isSkills: true,
                              ).then((value) {
                                setState(() {});
                              });
                            },
                            icon: const Icon(Icons.edit_outlined)),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const ShimmerProfileHeaderSkeleton();
            }
          },
        ),
      ],
    );
    //);
  }

  //TODO: USE GLOBALLY
  void customSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
