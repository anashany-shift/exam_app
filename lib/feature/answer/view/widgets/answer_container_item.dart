import 'package:exam_app/core/utils/app_colors.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswersContainerItem extends StatelessWidget {
  const AnswersContainerItem({
    super.key, required this.isSelected, required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
        var theme=Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top:16 ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(
          //   width: 1,
          //   color:isSelected? AppColors.green:Colors.transparent
          // ),

          color:isSelected?AppColors.blue[10]: AppColors.lightBlue,
        ),
      
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Checkbox(
                
                value: isSelected, onChanged: (value) {}),
              SizedBox(width: 8.w,),
              Text(text,style: theme.textTheme.bodyMedium,)
            ],
          ),
        ),
      ),
    );
  }
}
