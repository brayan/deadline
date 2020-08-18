import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DeadlinesState extends Equatable {
  DeadlinesState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends DeadlinesState {}

class Loading extends DeadlinesState {}

class Loaded extends DeadlinesState {
  final List<Deadline> deadlines;

  Loaded({@required this.deadlines}): super([deadlines]);
}

class Error extends DeadlinesState {
  final String message;

  Error({@required this.message}): super([message]);
}