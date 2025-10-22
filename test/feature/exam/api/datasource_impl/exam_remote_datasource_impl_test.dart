import 'package:exam_app/feature/exam/api/client/exam_api_client.dart';
import 'package:exam_app/feature/exam/api/datasource_impl/exam_remote_datasource_impl.dart';
import 'package:exam_app/feature/exam/data/models/question_response.dart';
import 'package:exam_app/feature/exam/data/models/questions_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exam_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ExamApiClient])
void main() {
  test(
    'verify when call get question should getQuestion from api and pass correct parm',
    () async {
      // Arrange
      MockExamApiClient mockExamApiClient = MockExamApiClient();
      ExamRemoteDataSourceImpl examRemoteDataSourceImpl =
          ExamRemoteDataSourceImpl(mockExamApiClient);

      var examId = "efwefewf";
      var expectedResponse = QuestionResponse(
        questionsDto: [QuestionsDto(), QuestionsDto()],
      );
      // when call get question and pass this param back to me this response

      when(
        mockExamApiClient.getQuestion(examId),
      ).thenAnswer((_) async => expectedResponse);

      //Act

      var result = await examRemoteDataSourceImpl.getQuestions(examId: examId);
      //Assert
      verify(mockExamApiClient.getQuestion(examId)).called(1);
      expect(result, isA<QuestionResponse>());
      expect(
        result.questionsDto?.length,
        equals(expectedResponse.questionsDto?.length),
      );
    },
  );
  test('should throw exception when api fails', () async {
    // Arrange
    final mockExamApiClient = MockExamApiClient();
    final examRemoteDataSourceImpl = ExamRemoteDataSourceImpl(mockExamApiClient);
    const examId = 'invalid-id';

    when(mockExamApiClient.getQuestion(examId))
        .thenThrow(Exception('Server error'));

    // Act & Assert
    expect(
          () => examRemoteDataSourceImpl.getQuestions(examId: examId),
      throwsException,
    );

    verify(mockExamApiClient.getQuestion(examId)).called(1);
  });
  test('should return empty list when api returns no questions', () async {
    final mockExamApiClient = MockExamApiClient();
    final examRemoteDataSourceImpl = ExamRemoteDataSourceImpl(mockExamApiClient);
    const examId = 'empty';

    final expectedResponse = QuestionResponse(questionsDto: []);

    when(mockExamApiClient.getQuestion(examId))
        .thenAnswer((_) async => expectedResponse);

    final result = await examRemoteDataSourceImpl.getQuestions(examId: examId);

    expect(result.questionsDto, isEmpty);
    verify(mockExamApiClient.getQuestion(examId)).called(1);
  });



}
