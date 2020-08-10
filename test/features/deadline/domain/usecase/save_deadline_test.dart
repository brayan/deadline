import 'package:dartz/dartz.dart';
import 'package:deadline/features/deadline/domain/entity/deadline.dart';
import 'package:deadline/features/deadline/domain/repository/deadline_repository.dart';
import 'package:deadline/features/deadline/domain/usecase/save_deadline.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDeadlineRepository extends Mock implements DeadlineRepository {}

void main() {
  MockDeadlineRepository mockRepository;
  SaveDeadline saveDeadline;

  setUp(() {
    mockRepository = MockDeadlineRepository();
    saveDeadline = SaveDeadline(mockRepository);
  });

  final deadline = Deadline(id: 1, name: 'Deadline 1', initialDateTime: DateTime.now(), finalDateTime: DateTime.now());

  test('should save deadline on repository', () async {
    when(mockRepository.saveDeadline(any)).thenAnswer((_) async => Right(true));

    final result = await saveDeadline(Params(deadline: deadline));

    expect(result, Right(true));
    verify(mockRepository.saveDeadline(deadline));
    verifyNoMoreInteractions(mockRepository);
  });
}
