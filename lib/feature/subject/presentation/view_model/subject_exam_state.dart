part of 'subject_exam_cubit.dart';

@immutable
sealed class SubjectExamState {}

class SubjectExamSuccess extends SubjectExamState {
  final List<SubjectExamEntity> subjectExam;

  SubjectExamSuccess({required this.subjectExam});
}

class SubjectExamLoading extends SubjectExamState {}

class SubjectExamError extends SubjectExamState {
  final String errorMessage;
  SubjectExamError({required this.errorMessage});
}

class SubjectExamEmpty extends SubjectExamState {}
