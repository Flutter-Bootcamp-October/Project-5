part of 'radio_button_bloc.dart';

abstract class RadioButtonState {}

final class RadioButtonInitial extends RadioButtonState {}

final class Radiostate extends RadioButtonState {
  final String value;

  Radiostate(this.value);
}
