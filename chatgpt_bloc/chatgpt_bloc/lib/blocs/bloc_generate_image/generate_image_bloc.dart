import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_event.dart';
import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_state.dart';
import 'package:chatgpt_bloc/networking/networking_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateImageBloc extends Bloc<SendTextEvent, GenerateImageState> {
  GenerateImageBloc() : super(InitialState()) {
    on<SendTextEvent>(
      (event, emit) async {
        try {
          emit(LoadingState());
          String image = '';
          image = await ApiNetworking().getImage(event.textImage);

          if (image.isNotEmpty) {
            event.loadingImage = true;
          }

          print(image);
          emit(ResultImageState(
              urlString: image, changeLoadingImage: event.loadingImage));
        } catch (er) {
          emit(CatchState(textError: 'Can\'t get what you want'));
        }
      },
    );
  }
}
