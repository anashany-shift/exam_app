import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/feature/main_layout/explore/domain/entities/subjects_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectCardItem extends StatelessWidget {
  const SubjectCardItem({super.key, required this.subject});
  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.subject,arguments: subject.id);

      },
      child: Padding(
        padding: const EdgeInsets.only(right: 2.0, bottom: 16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              children: [
                SizedBox(
                  height:50.h,
                  width: 50.w,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: subject.icon,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(subject.name, style: theme.textTheme.titleSmall,overflow: TextOverflow.ellipsis,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
