import 'package:dartz/dartz.dart';
import 'package:deadline/core/usecase/usecase.dart';
import 'package:deadline/feature/deadline/domain/entity/deadline.dart';
import 'package:deadline/feature/deadline/domain/repository/deadline_repository.dart';
import 'package:deadline/feature/deadline/domain/usecase/get_deadlines.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDeadlineRepository extends Mock implements DeadlineRepository {}

void main() {
  MockDeadlineRepository mockRepository;
  GetDeadlines getDeadlines;

  setUp(() {
    mockRepository = MockDeadlineRepository();
    getDeadlines = GetDeadlines(mockRepository);
  });

  final deadlines = List<Deadline>();
  deadlines.add(Deadline(name: 'Deadline 1', initialDateTime: DateTime.now(), finalDateTime: DateTime.now()));
  deadlines.add(Deadline(name: 'Deadline 2', initialDateTime: DateTime.now(), finalDateTime: DateTime.now()));

  test('should get deadlines from repository', () async {
    when(mockRepository.getDeadlines()).thenAnswer((_) async => Right(deadlines));

    final result = await getDeadlines(NoParams());

    expect(result, Right(deadlines));
    verify(mockRepository.getDeadlines());
    verifyNoMoreInteractions(mockRepository);
  });
}
