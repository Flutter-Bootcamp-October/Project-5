import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/information_widget/education_expansiontile_widget.dart';
import 'package:cv_app/widgets/information_widget/textfield_date_widget.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.monthController,
    required this.dayController,
    required this.yearController,
  });

  final TextEditingController monthController;
  final TextEditingController dayController;
  final TextEditingController yearController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldDate(
            controller: monthController,
            hint: 'Month',
          ),
        ),
        width10,
        Expanded(
          child: TextFieldDate(
            controller: dayController,
            hint: 'Day',
          ),
        ),
        width10,
        Expanded(
          child: TextFieldDate(
            controller: yearController,
            hint: 'Year',
          ),
        ),
      ],
    );
  }
}
