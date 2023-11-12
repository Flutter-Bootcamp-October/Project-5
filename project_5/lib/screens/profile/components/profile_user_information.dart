// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/services/about_api.dart';
import 'package:flutter/services.dart';
import 'package:project_5/theme/shimmer/shimmer_profile_header_skeleton.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 3,
      onRefresh: () async {
        await _updateImgWidget(url: widget.imageUrl);
        setState(() {});
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
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
                          onLongPress: () async {
                            XFile? file =
                                await _picker.pickImage(source: source);
                            if (file == null) {
                              customSnackBar(
                                  context: context,
                                  message: "No Image was selected");
                            } else {
                              filePath = File(file.path);
                              imageCache.clear();
                              uploadAboutImageApi(image: filePath!);
                              await _updateImgWidget(
                                  url: aboutModel.data!.image);
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
                                onPressed: () {},
                                icon: const Icon(Icons.edit_outlined)),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const ShimmerProfileHeaderSkeleton();
                }
              }),
          //TODO: GET SOCIAL MEDIA
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                        width: 300,
                        child: FlexList(
                          horizontalSpacing: 4,
                          verticalSpacing: 5,
                          children: [
                            Text("${snapshot.data}"),
                            Text("${snapshot.data}"),
                            Text("${snapshot.data}"),
                          ],
                        ));
                  } else {
                    return ShimmerTextSkeleton(
                      numberOfItems: 3,
                      itemWidth: context.getWidth() * .85 / 3.8,
                    );
                  }
                }),
          ),
          const Divider(
              thickness: .8,
              indent: 16,
              endIndent: 16,
              color: Color(0xffded3fc)),
        ],
      ),
    );
  }

  //TODO: USE GLOBALLY
  void customSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
