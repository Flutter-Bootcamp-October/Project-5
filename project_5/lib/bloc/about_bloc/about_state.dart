part of 'about_cubit.dart';

@immutable
abstract class AboutState {}

class AboutInitial extends AboutState {}

class AboutGetDataState extends AboutState {
  final AboutModel aboutModel;

  AboutGetDataState({required this.aboutModel});
}

class AboutChangeImageState extends AboutState {}

class AboutChangeBioState extends AboutState {}

class AboutRefreshState extends AboutState {}

class AboutErrorState extends AboutState {}
