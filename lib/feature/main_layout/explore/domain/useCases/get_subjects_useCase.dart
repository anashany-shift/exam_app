
import 'package:exam_app/feature/main_layout/explore/domain/repos/subjects_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../entities/subjects_entity.dart';

@injectable
class GetSubjectUseCase{
  final SubjectsRepo subjectsRepo;

  GetSubjectUseCase(this.subjectsRepo);

  Future<ApiResult<List<SubjectEntity>>>call()async{

    return await subjectsRepo.getSubjects();
  }
}