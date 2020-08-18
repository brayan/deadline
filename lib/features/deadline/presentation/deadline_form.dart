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
  final _controllerAccountNumber = TextEditingController();
  final _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerAccountNumber, label: "Número da Conta", hint: "0000"),
            Editor(controller: _controllerValue, label: labelValue, hint: "0.00", icon: Icons.monetization_on),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final account = int.tryParse(_controllerAccountNumber.text);
    final value = double.tryParse(_controllerValue.text);

    if (account != null && value != null) {
      final deadline = Deadline(
        id: 1,
        name: 'Deadline 1',
        initialDateTime: DateTime.now(),
        finalDateTime: DateTime.now(),
      );
      debugPrint("$deadline");
      Navigator.pop(context, deadline);
    }
  }
}
