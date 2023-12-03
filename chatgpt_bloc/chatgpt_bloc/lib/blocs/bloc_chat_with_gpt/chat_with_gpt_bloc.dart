import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_event.dart';
import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_state.dart';
import 'package:chatgpt_bloc/networking/networking_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWithGPTBloc extends Bloc<SendTextEvent, ChatWithGPTState> {
  ChatWithGPTBloc() : super(InitialState()) {
    on<SendTextEvent>(
      (event, emit) async {
        try {
          emit(WriteTextUserState());

          emit(LoadingState());
          String answer;
          final answerGPT =
              await ApiNetworking().chatWithGPT(msg: event.textChat);
          answer = answerGPT;

          emit(ResultTextSendState(resultText: answer));
        } catch (er) {
          emit(CatchState(textError: 'Can\'t get what you want'));
        }
      },
    );
  }
}
