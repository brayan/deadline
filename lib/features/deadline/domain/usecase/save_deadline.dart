import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:deadline/core/error/failure.dart';
import 'package:deadline/core/usecase/usecase.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/domain/repository/deadline_repository.dart';

class SaveDeadline implements UseCase<bool, Params> {
  final DeadlineRepository repository;

  SaveDeadline(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.saveDeadline(params.deadline);
  }
}

class Params extends Equatable {
  final Deadline deadline;

  Params({@required this.deadline}) : super([deadline]);
}