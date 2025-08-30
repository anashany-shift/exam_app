import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:exam_app/presentation/features/main_layout/explore/view/widgets/subject_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Survey",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: 16.h),
        CustomTextFormField(
          textFormFieldModel: TextFormFieldModel(
            hint: "Search",
            suffixIcon: const Icon(Icons.search),
            border: 25,
          ),
        ),
        SizedBox(height: 40.h),
        Text("Browse by subject", style: theme.textTheme.titleMedium),
        SizedBox(height: 24.h),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
            return const SubjectCardItem();
          },),
        ),
      ],
    );
  }
}

