import 'package:dartz/dartz.dart';
import 'package:deadline/core/error/failure.dart';
import 'package:deadline/core/usecase/usecase.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/domain/repository/deadline_repository.dart';

class GetDeadlines implements UseCase<List<Deadline>, NoParams> {
  final DeadlineRepository repository;

  GetDeadlines(this.repository);

  @override
  Future<Either<Failure, List<Deadline>>> call(NoParams params) async {
    return await repository.getDeadlines();
  }
}
