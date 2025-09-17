import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/main_layout/explore/presentation/view/widgets/subject_card_item.dart';
import 'package:exam_app/feature/main_layout/explore/presentation/view_model/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectCardListView extends StatelessWidget {
  const SubjectCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is SubjectExploreSuccess){
          final subject=state.subjects;
             return ListView.builder(
               itemCount: subject.length,
               itemBuilder: (context, index) {
                 return  SubjectCardItem(subject:subject[index]);
               },);
        }else if(state is SubjectExploreError){
          return const Center(child: Text("not found"));
        }else {
          return const CustomProgressIndicator();
        }

      },
    );
  }
}
