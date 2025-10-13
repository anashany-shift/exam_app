import 'package:hive/hive.dart';

part 'completed_exam.g.dart';

@HiveType(typeId: 0)
class CompletedExam extends HiveObject {
  @HiveField(0)
  late String examId;

  @HiveField(1)
  late String examName;

  @HiveField(2)
  late List<QuestionEntityHive> questions;

  @HiveField(3)
  late Map<String, String> userAnswers;

  @HiveField(4)
  late CheckQuestionEntityHive result;

  @HiveField(5)
  late DateTime completedDate;
}

@HiveType(typeId: 1)
class QuestionEntityHive extends HiveObject {
  @HiveField(0)
  late List<AnswerEntityHive>? answers;
  @HiveField(1)
  late String? type;
  @HiveField(2)
  late String? correct;
  @HiveField(3)
  late String? question;
  @HiveField(4)
  late String? id;
  @HiveField(5)
  // CORRECTED: Must be ExamInfoEntityHive, not ExamInfoEntity
  late ExamInfoEntityHive? examInfoEntity;
}

@HiveType(typeId: 2)
class AnswerEntityHive extends HiveObject {
  @HiveField(0)
  late String? key;
  @HiveField(1)
  late String? value; // Renamed to 'value' to be consistent with mappers
}

@HiveType(typeId: 3)
class CheckQuestionEntityHive extends HiveObject {
  @HiveField(0)
  late int? correct;
  @HiveField(1)
  late int? wrong;
  @HiveField(2)
  late String? total;
}

// ADDED: This class was missing from your code
@HiveType(typeId: 4)
class ExamInfoEntityHive extends HiveObject {
  @HiveField(0)
  late int? numberOfQuestions;
  @HiveField(1)
  late int? duration;
  @HiveField(2)
  late String? title;
  @HiveField(3)
  late String? examId;
}