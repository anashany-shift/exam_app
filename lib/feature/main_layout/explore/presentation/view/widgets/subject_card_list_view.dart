import 'package:exam_app/feature/main_layout/explore/domain/entities/subjects_entity.dart';
import 'package:exam_app/feature/main_layout/explore/presentation/view/widgets/subject_card_item.dart';
import 'package:exam_app/feature/main_layout/explore/presentation/view_model/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectCardListView extends StatelessWidget {
  const SubjectCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is SubjectExploreSuccess) {
          final subjects = state.subjects;
          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return SubjectCardItem(subject: subjects[index]);
            },
          );
        } else if (state is SubjectExploreError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return SubjectCardItem(
                  subject: SubjectEntity(id: "", name: "", icon: ""),
                );
              },
            ),
          );
        }
      },
    );
  }
}
