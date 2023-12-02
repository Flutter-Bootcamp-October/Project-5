part of 'page_bloc.dart';

abstract class PageState {}

final class PageInitial extends PageState {}

final class ChangePageState extends PageState {
  final int index;

  ChangePageState({required this.index});
}
final class SuccessTokenState extends PageState {
}
final class WrongTokenState extends PageState {
}