import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../models/completed_exam.dart';

@lazySingleton
class ExamLocalDataSource {
  static const String _boxName = 'completed_exams_box';

  Future<void> saveCompletedExam(CompletedExam exam) async {
    final box = Hive.box<CompletedExam>(_boxName);
    await box.put(exam.examId, exam);
  }

  Future<List<CompletedExam>> getCompletedExams() async {
    final box = Hive.box<CompletedExam>(_boxName);
    return box.values.toList();
  }
}