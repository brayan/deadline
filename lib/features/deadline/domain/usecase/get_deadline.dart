import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:deadline/core/error/failure.dart';
import 'package:deadline/core/usecase/usecase.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/domain/repository/deadline_repository.dart';

class GetDeadline implements UseCase<Deadline, Params> {
  final DeadlineRepository repository;

  GetDeadline(this.repository);

  @override
  Future<Either<Failure, Deadline>> call(Params params) async {
    return await repository.getDeadline(params.id);
  }
}

class Params extends Equatable {
  final int id;

  Params({@required this.id}) : super([id]);
}
