import 'package:dartz/dartz.dart';
import 'package:deadline/core/error/failure.dart';
import 'package:deadline/feature/deadline/domain/entity/deadline.dart';

abstract class DeadlineRepository {
  Future<Either<Failure, List<Deadline>>> getDeadlines();
}
