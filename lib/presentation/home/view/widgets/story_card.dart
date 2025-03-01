import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/core/utils/text_style.dart';
import 'package:facebook/domain/models/story/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.w),
          width: 103,
          height: 183,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(story.image),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          child: SizedBox(
            width: 55.w,
            child: Text(
              story.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.while12Bold700,
            ),
          ),
        ),
      ],
    );
  }
}
