// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_exam.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedExamAdapter extends TypeAdapter<CompletedExam> {
  @override
  final int typeId = 0;

  @override
  CompletedExam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedExam()
      ..examId = fields[0] as String
      ..examName = fields[1] as String
      ..questions = (fields[2] as List).cast<QuestionEntityHive>()
      ..userAnswers = (fields[3] as Map).cast<String, String>()
      ..result = fields[4] as CheckQuestionEntityHive
      ..completedDate = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, CompletedExam obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.examId)
      ..writeByte(1)
      ..write(obj.examName)
      ..writeByte(2)
      ..write(obj.questions)
      ..writeByte(3)
      ..write(obj.userAnswers)
      ..writeByte(4)
      ..write(obj.result)
      ..writeByte(5)
      ..write(obj.completedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedExamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestionEntityHiveAdapter extends TypeAdapter<QuestionEntityHive> {
  @override
  final int typeId = 1;

  @override
  QuestionEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionEntityHive()
      ..answers = (fields[0] as List?)?.cast<AnswerEntityHive>()
      ..type = fields[1] as String?
      ..correct = fields[2] as String?
      ..question = fields[3] as String?
      ..id = fields[4] as String?
      ..examInfoEntity = fields[5] as ExamInfoEntityHive?;
  }

  @override
  void write(BinaryWriter writer, QuestionEntityHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.answers)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.correct)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.examInfoEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnswerEntityHiveAdapter extends TypeAdapter<AnswerEntityHive> {
  @override
  final int typeId = 2;

  @override
  AnswerEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerEntityHive()
      ..key = fields[0] as String?
      ..value = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, AnswerEntityHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CheckQuestionEntityHiveAdapter
    extends TypeAdapter<CheckQuestionEntityHive> {
  @override
  final int typeId = 3;

  @override
  CheckQuestionEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckQuestionEntityHive()
      ..correct = fields[0] as int?
      ..wrong = fields[1] as int?
      ..total = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, CheckQuestionEntityHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.correct)
      ..writeByte(1)
      ..write(obj.wrong)
      ..writeByte(2)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckQuestionEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamInfoEntityHiveAdapter extends TypeAdapter<ExamInfoEntityHive> {
  @override
  final int typeId = 4;

  @override
  ExamInfoEntityHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamInfoEntityHive()
      ..numberOfQuestions = fields[0] as int?
      ..duration = fields[1] as int?
      ..title = fields[2] as String?
      ..examId = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, ExamInfoEntityHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.numberOfQuestions)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.examId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamInfoEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
