import 'package:hive_flutter/hive_flutter.dart';
import 'package:exam_app/feature/exam/data/models/completed_exam.dart';

class HiveConfig {
  HiveConfig._();

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CompletedExamAdapter());
    Hive.registerAdapter(QuestionEntityHiveAdapter());
    Hive.registerAdapter(AnswerEntityHiveAdapter());
    Hive.registerAdapter(CheckQuestionEntityHiveAdapter());
    Hive.registerAdapter(ExamInfoEntityHiveAdapter());

    await Hive.openBox<CompletedExam>('completed_exams_box');
  }
}