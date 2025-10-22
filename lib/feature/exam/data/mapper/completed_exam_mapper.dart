import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:exam_app/feature/exam/domain/entities/exam_info_entity.dart';
import 'package:exam_app/feature/exam/domain/entities/answer_entity.dart';
import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:exam_app/feature/exam/data/models/completed_exam.dart'; // مسار ملف الـ Hive Models


extension QuestionEntityMapper on QuestionEntity {
  QuestionEntityHive toHive() {
    return QuestionEntityHive()
      ..answers = answers?.map((a) => a.toHive()).toList()
      ..type = type
      ..correct = correct
      ..question = question
      ..id = id
      ..examInfoEntity = examInfoEntity?.toHive();
  }
}

extension QuestionEntityHiveMapper on QuestionEntityHive {
  QuestionEntity toEntity() {
    return QuestionEntity(
      answers: answers?.map((a) => a.toEntity()).toList(),
      type: type,
      correct: correct,
      question: question,
      id: id,
      examInfoEntity: examInfoEntity?.toEntity(),
    );
  }
}


extension AnswerEntityMapper on AnswerEntity {
  AnswerEntityHive toHive() {
    return AnswerEntityHive()
      ..key = key
      ..value = answer;
  }
}

extension AnswerEntityHiveMapper on AnswerEntityHive {
  AnswerEntity toEntity() {
    return AnswerEntity(
      key: key,
      answer: value,
    );
  }
}


extension ExamInfoEntityMapper on ExamInfoEntity {
  ExamInfoEntityHive toHive() {
    return ExamInfoEntityHive()
      ..numberOfQuestions = numberOfQuestions
      ..duration = duration
      ..title = title
      ..examId = examId;
  }
}

extension ExamInfoEntityHiveMapper on ExamInfoEntityHive {
  ExamInfoEntity toEntity() {
    return ExamInfoEntity(
      numberOfQuestions: numberOfQuestions,
      duration: duration,
      title: title,
      examId: examId,
    );
  }
}



extension CheckQuestionEntityMapper on CheckQuestionEntity {
  CheckQuestionEntityHive toHive() {
    return CheckQuestionEntityHive()
      ..correct = correct
      ..wrong = wrong
      ..total = total;
  }
}

extension CheckQuestionEntityHiveMapper on CheckQuestionEntityHive {
  CheckQuestionEntity toEntity() {
    return CheckQuestionEntity(
      correct: correct,
      wrong: wrong,
      total: total,
    );
  }
}


class CompletedExamMapper {
  static CompletedExam toHive({
    required String examId,
    required String examName,
    required List<QuestionEntity> questions,
    required Map<String, String> userAnswers,
    required CheckQuestionEntity result,
    required DateTime completedDate,
  }) {
    return CompletedExam()
      ..examId = examId
      ..examName = examName
      ..questions = questions.map((q) => q.toHive()).toList()
      ..userAnswers = userAnswers
      ..result = result.toHive()
      ..completedDate = completedDate;
  }

  static CompletedExamData fromHive(CompletedExam hiveModel) {
    return CompletedExamData(
      examId: hiveModel.examId,
      examName: hiveModel.examName,
      questions:
      hiveModel.questions.map((q) => q.toEntity()).toList(),
      userAnswers: Map<String, String>.from(hiveModel.userAnswers),
      result: hiveModel.result.toEntity(),
      completedDate: hiveModel.completedDate,
    );
  }
}

class CompletedExamData {
  final String examId;
  final String examName;
  final List<QuestionEntity> questions;
  final Map<String, String> userAnswers;
  final CheckQuestionEntity result;
  final DateTime completedDate;

  CompletedExamData({
    required this.examId,
    required this.examName,
    required this.questions,
    required this.userAnswers,
    required this.result,
    required this.completedDate,
  });
}
