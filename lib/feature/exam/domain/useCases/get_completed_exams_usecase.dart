import 'package:injectable/injectable.dart';

import '../../data/models/completed_exam.dart';
import '../repo/exam_repo.dart';

@injectable
class GetCompletedExamsUseCase {
  final ExamRepo examRepo;

  GetCompletedExamsUseCase(this.examRepo);

  Future<List<CompletedExam>> call() async {
    return await examRepo.getCompletedExams();
  }
}