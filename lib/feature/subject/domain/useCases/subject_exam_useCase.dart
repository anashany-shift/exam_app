import 'package:exam_app/feature/subject/domain/repos/subject_exam_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/api_result.dart';
import '../entities/subject_exam_entity.dart';

@injectable
class SubjectExamUseCase{
  final SubjectExamRepo subjectExamRepo;

  SubjectExamUseCase(this.subjectExamRepo);

  Future<ApiResult<List<SubjectExamEntity>>>call({required String subjectId})async{
    return await subjectExamRepo.getSubjectExam(subjectId: subjectId);
  }

}