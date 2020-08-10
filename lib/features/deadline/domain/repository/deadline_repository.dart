import 'package:dartz/dartz.dart';
import 'package:deadline/core/error/failure.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';

abstract class DeadlineRepository {
  Future<Either<Failure, List<Deadline>>> getDeadlines();
  Future<Either<Failure, Deadline>> getDeadline(int id);
  Future<Either<Failure, bool>> saveDeadline(Deadline deadline);
}
