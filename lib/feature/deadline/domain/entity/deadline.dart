import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Deadline extends Equatable {
  final String name;
  final DateTime initialDateTime;
  final DateTime finalDateTime;

  Deadline({@required this.name, @required this.initialDateTime, @required this.finalDateTime})
      : super([name, initialDateTime, finalDateTime]);
}
