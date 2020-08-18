import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DeadlinesEvent extends Equatable {
  DeadlinesEvent([List props = const <dynamic>[]]) : super(props);
}

class GetDeadlines extends DeadlinesEvent {
  final String search;

  GetDeadlines(this.search): super([search]);
}