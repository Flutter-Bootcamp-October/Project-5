abstract class ChatWithGPTState {}

class InitialState extends ChatWithGPTState {}

class ResultTextSendState extends ChatWithGPTState {
  final String resultText;

  ResultTextSendState({required this.resultText});
}

class WriteTextUserState extends ChatWithGPTState {}

class LoadingState extends ChatWithGPTState {}
class ErrorState extends ChatWithGPTState {}
class CatchState extends ChatWithGPTState {
  final String textError;

  CatchState({required this.textError});
}
