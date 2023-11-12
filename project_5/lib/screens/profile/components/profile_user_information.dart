import 'dart:io';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/services/about_api.dart';
import 'package:flutter/services.dart';

class ProfileUserInformation extends StatefulWidget {
  const ProfileUserInformation({
    super.key,
    this.userData,
  });
  final AboutModel? userData;

  @override
  State<ProfileUserInformation> createState() => _ProfileUserInformationState();
}

class _ProfileUserInformationState extends State<ProfileUserInformation> {
  String url = "";
  ImageProvider? _pic;
  bool isLoading = false;
  @override
  void initState() {
    url = widget.userData?.data?.image ?? "";
    _pic = NetworkImage(url);
    isLoading = true;
    super.initState();
  }

  Uint8List? bytes;

  _updateImgWidget() async {
    isLoading = false;
    bytes = null;
    Future.delayed(
      const Duration(seconds: 5),
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
        await _updateImgWidget();
        setState(() {});
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              onLongPress: () async {
                XFile? file = await _picker.pickImage(source: source);
                if (file == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("No Image was selected")));
                } else {
                  filePath = File(file.path);
                  imageCache.clear();
                  uploadAboutImageApi(image: filePath!);
                  _updateImgWidget();
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
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.userData?.data?.name}"),
                    Text(widget.userData?.data?.about ??
                        "-You have no bio yet-"),
                    SizedBox(
                        width: 300,
                        child: FlexList(
                          horizontalSpacing: 4,
                          verticalSpacing: 5,
                          children: const [
                            Text("{Social Media}"),
                            Text("{Social Media}"),
                            Text("{Social Media}"),
                          ],
                        )),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
              ],
            ),
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
}
