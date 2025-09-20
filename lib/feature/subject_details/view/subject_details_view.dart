import 'package:exam_app/feature/subject/domain/entities/subject_exam_entity.dart';
import 'package:exam_app/feature/subject_details/view/widgets/subject_details_view_body.dart';
import 'package:flutter/material.dart';

class SubjectDetailsView extends StatelessWidget {
  const SubjectDetailsView({super.key, required this.subjectExamEntity});

  final SubjectExamEntity subjectExamEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SubjectDetailsViewBody(subjectExam: subjectExamEntity),
      ),
    );
  }
}
