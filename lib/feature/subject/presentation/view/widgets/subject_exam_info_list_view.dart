import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/subject/presentation/view/widgets/subject_exam_info_card_item.dart';
import 'package:exam_app/feature/subject/presentation/view_model/subject_exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectExamInfoListView extends StatelessWidget {
  const SubjectExamInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectExamCubit, SubjectExamState>(
      builder: (context, state) {
        switch (state) {
          case SubjectExamEmpty():
            return const Center(
              child: Text("No Exams", style: TextStyle(fontSize: 30)),
            );

          case SubjectExamSuccess():
            final subject = state.subjectExam;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subject.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SubjectExamInfoCardItem(subjectExam: subject[index]),
                );
              },
            );
          case SubjectExamLoading():
            return const CustomProgressIndicator();
          case SubjectExamError():
            return const Center(child: Text("not found"));
        }
      },
    );
  }
}
