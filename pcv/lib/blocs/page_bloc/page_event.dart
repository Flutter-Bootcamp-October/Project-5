part of 'page_bloc.dart';
abstract class PageEvent {}

class ChangePageEvent extends PageEvent {
  final int index;

  ChangePageEvent({required this.index});
}
