import 'package:dartz/dartz.dart';
import 'package:deadline/core/usecase/usecase.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/domain/repository/deadline_repository.dart';
import 'package:deadline/features/deadline/domain/usecase/get_deadline.dart';
import 'package:deadline/features/deadline/domain/usecase/get_deadlines.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDeadlineRepository extends Mock implements DeadlineRepository {}

void main() {
  MockDeadlineRepository mockRepository;
  GetDeadline getDeadline;

  setUp(() {
    mockRepository = MockDeadlineRepository();
    getDeadline = GetDeadline(mockRepository);
  });

  final deadline = Deadline(id: 1, name: 'Deadline 1', initialDateTime: DateTime.now(), finalDateTime: DateTime.now());

  test('should get deadline from repository', () async {
    when(mockRepository.getDeadline(any)).thenAnswer((_) async => Right(deadline));

    final result = await getDeadline(Params(id: 1));

    expect(result, Right(deadline));
    verify(mockRepository.getDeadline(1));
    verifyNoMoreInteractions(mockRepository);
  });
}
