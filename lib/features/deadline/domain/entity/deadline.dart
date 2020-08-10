import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Deadline extends Equatable {
  final int id;
  final String name;
  final DateTime initialDateTime;
  final DateTime finalDateTime;

  Deadline({@required this.id, @required this.name, @required this.initialDateTime, @required this.finalDateTime})
      : super([id, name, initialDateTime, finalDateTime]);
}
