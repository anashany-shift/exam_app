import 'package:exam_app/feature/subject/subject_details/view/widgets/subject_details_view_body.dart';
import 'package:flutter/material.dart';

class SubjectDetailsView extends StatelessWidget {
  const SubjectDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: SubjectDetailsViewBody()),
     
    );
  }
}