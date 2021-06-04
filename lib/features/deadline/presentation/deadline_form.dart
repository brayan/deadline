import 'package:deadline/core/presentation/dracula_theme.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:flutter/material.dart';

import 'editor.dart';

const appBarTitle = 'New Deadline';
const labelValue = 'Valor';

class DeadlineForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DeadlineFormState();
  }
}

class DeadlineFormState extends State<DeadlineForm> {
  final _controllerDeadlineDescription = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerDeadlineDescription, label: "Deadline Description"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: RaisedButton(
                    child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                    onPressed: () => onClickDate(context),
                  ),
                ),
                RaisedButton(
                  child: Text("${selectedTime.format(context)}"),
                  onPressed: () => onClickTime(context),
                ),
              ],
            ),

            RaisedButton(
              color: DraculaTheme.comment,
              child: Text("Confirmar"),
              onPressed: () => _onClickAddDeadline(context),
            )
          ],
        ),
      ),
    );
  }

  void _onClickAddDeadline(BuildContext context) {
    final description = _controllerDeadlineDescription.text;

    if (description != null) {
      final deadline = Deadline(
        id: 1,
        name: description,
        initialDateTime: DateTime.now(),
        finalDateTime: DateTime.now(),
      );
      debugPrint("$deadline");
      Navigator.pop(context, deadline);
    }
  }

  Future<void> onClickDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> onClickTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }
}
