import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/feature/main_layout/explore/domain/entities/subjects_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectCardItem extends StatelessWidget {
  const SubjectCardItem({super.key, required this.subject});
  final SubjectEntity subject;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (subject.id.isNotEmpty) {
          Navigator.pushNamed(context, Routes.subject, arguments: subject.id);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 2.0, bottom: 16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              children: [
                // Image with Skeleton
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Skeleton.leaf(
                    child: ClipOval(
                      child: subject.icon.isNotEmpty
                          ? CachedNetworkImage(
                        imageUrl: subject.icon,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      )
                          : Container(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Title with Skeleton
                Expanded(
                  child: Skeleton.leaf(
                    child: Text(
                      subject.name.isNotEmpty ? subject.name : "Loading...",
                      style: theme.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
