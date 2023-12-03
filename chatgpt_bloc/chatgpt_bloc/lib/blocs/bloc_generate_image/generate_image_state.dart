abstract class GenerateImageState {}

class InitialState extends GenerateImageState {}

class ResultImageState extends GenerateImageState {
  final String urlString;
  final bool changeLoadingImage;

  ResultImageState({required this.urlString, required this.changeLoadingImage});
}

class LoadingState extends GenerateImageState {}
class ErrorState extends GenerateImageState {}
class CatchState extends GenerateImageState {
  final String textError;

  CatchState({required this.textError});
}
