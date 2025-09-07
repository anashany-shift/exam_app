import 'package:exam_app/feature/main_layout/explore/view/widgets/subject_card_item.dart';
import 'package:flutter/material.dart';

class SubjectCardListView extends StatelessWidget {
  const SubjectCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const SubjectCardItem();
        },),
    );
  }
}
