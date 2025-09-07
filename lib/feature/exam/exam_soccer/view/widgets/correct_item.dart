import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CorrectItem extends StatelessWidget {
  const CorrectItem({super.key, required this.title, required this.color, required this.count});
  final String title;
  final int count;
  final Color color;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(color: color),
          ),
        ),
        SizedBox(width: 50.w),
        Container(
          width: 32,   // عرض ثابت
          height: 32,


          decoration: ShapeDecoration(
            shape: CircleBorder(side: BorderSide(color: color, width: 2)),
          ),
          alignment: Alignment.center,
          child: Text(
          "$count",
            style: theme.textTheme.titleSmall!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
