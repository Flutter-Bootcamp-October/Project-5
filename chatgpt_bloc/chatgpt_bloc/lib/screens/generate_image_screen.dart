import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_event.dart';
import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateImage extends StatelessWidget {
  GenerateImage({super.key});

  bool isLoad = false;
  TextEditingController textImageCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(159, 255, 255, 255),
                  Color.fromARGB(144, 68, 137, 255),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: textImageCon,
                        decoration: InputDecoration(
                          hintText: 'Enter a description of the image',
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            context.read<GenerateImageBloc>().add(SendTextEvent(
                                  textImage: textImageCon.text,
                                  loadingImage: isLoad,
                                ));

                            // if (image.isNotEmpty) {
                            //   isLoad = true;

                            //   //setState(() {});
                            // } else {
                            //   const Center(
                            //     child: CircularProgressIndicator(),
                            //   );
                            // }
                          },
                          icon: const Icon(
                            Icons.image,
                            size: 40,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child:
                            BlocBuilder<GenerateImageBloc, GenerateImageState>(
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is ResultImageState) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        150, 158, 158, 158),
                                    borderRadius: BorderRadius.circular(20)),
                                child: state.changeLoadingImage
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.network(
                                          state.urlString,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(),
                              );
                            }
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
