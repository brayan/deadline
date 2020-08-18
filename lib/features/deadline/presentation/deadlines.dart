import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/presentation/deadline_form.dart';
import 'package:flutter/material.dart';

class DeadlinesWidget extends StatefulWidget {
  // only constants stay here.. variables goes to the state
  final List<Deadline> _deadlines = List();

  @override
  State<StatefulWidget> createState() {
    return DeadlinesState();
  }
}

class DeadlinesState extends State<DeadlinesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282A36),
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Deadlines'),
        ),
        body: ListView.builder(
          itemCount: widget._deadlines.length,
          itemBuilder: (context, index) {
            final deadline = widget._deadlines[index];
            return DeadlineItem(deadline);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => onClickAddDeadline(context),
        ));
  }

  void onClickAddDeadline(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DeadlineForm();
    })).then((deadline) {
      if (deadline != null) {
        setState(() {
          widget._deadlines.add(deadline);
        });
      }
    });
  }
}

class DeadlineItem extends StatelessWidget {
  final Deadline _deadline;

  DeadlineItem(this._deadline);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_deadline.name),
        subtitle: Text(_deadline.id.toString()),
      ),
    );
  }
}
