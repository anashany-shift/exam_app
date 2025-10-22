import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/main_layout/explore/data/datasources/remote_datasource/subject_remote_data_source.dart';
import 'package:exam_app/feature/main_layout/explore/data/model/meta_data_dto.dart';
import 'package:exam_app/feature/main_layout/explore/data/model/subject_dto.dart';
import 'package:exam_app/feature/main_layout/explore/data/model/subject_response.dart';
import 'package:exam_app/feature/main_layout/explore/data/repo_impl/subjects_repo_impl.dart';
import 'package:exam_app/feature/main_layout/explore/domain/entities/subjects_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'subjects_repo_impl_test.mocks.dart';

@GenerateMocks([SubjectsRemoteDataSource])
void main() {
  test(

    "when call get subject it should get subject from subject remote data source ",
    () async {
      SubjectsRemoteDataSource subjectsRemoteDataSource =
          MockSubjectsRemoteDataSource();

      SubjectsRepoImpl subjectsRepoImpl = SubjectsRepoImpl(
        subjectsRemoteDataSource,
      );
      final expectedResponse = SubjectResponse(
        message: "evkwv",
        metadata: MetadataDto(),
        subjects: [
          SubjectsDto(Id: "1", name: "eve", icon: "ebewb"),
          SubjectsDto(Id: "1", name: "eve", icon: "ebewb"),
        ],
      );
      var expectesubject = [
        const SubjectEntity(id: "1", name: "eve", icon: "ebewb"),
        const SubjectEntity(id: "1", name: "eve", icon: "ebewb"),
      ];
      var excpetResult = ApiSuccessResult(expectesubject);

      when(
        subjectsRemoteDataSource.getSubjects(),
      ).thenAnswer((_) async => expectedResponse);

      final result = await subjectsRepoImpl.getSubjects();
      verify(subjectsRemoteDataSource.getSubjects()).called(1);

      expect(result, isA<ApiSuccessResult<List<SubjectEntity>>>());
      result as ApiSuccessResult<List<SubjectEntity>>;
      expect(result.data, equals(expectesubject));
    },
  );

  late MockSubjectsRemoteDataSource mockSubjectsRemoteDataSource;
  late SubjectsRepoImpl subjectsRepoImpl;

  setUp(() {
    mockSubjectsRemoteDataSource = MockSubjectsRemoteDataSource();
    subjectsRepoImpl = SubjectsRepoImpl(mockSubjectsRemoteDataSource);
  });

  test(
    "when getSubjects throws Exception it should return ApiFailureResult",
    () async {
      // arrange
      when(mockSubjectsRemoteDataSource.getSubjects())
          .thenThrow(Exception("Server error"));

      // act
      final result = await subjectsRepoImpl.getSubjects();

      // assert
      verify(mockSubjectsRemoteDataSource.getSubjects()).called(1);

      expect(result, isA<ApiErrorResult>());
      final errorResult = result as ApiErrorResult;
      expect(errorResult.errorMessage, contains("Server error"));
    },
  );

}
