import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/core/utils/text_style.dart';
import 'package:facebook/domain/models/post/post.dart';
import 'package:facebook/gen/assets.gen.dart';
import 'package:facebook/presentation/home/view/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 43.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            visualDensity: VisualDensity.compact,
            leading: ProfileAvatar(
              height: 48.h,
              width: 48.w,
              image: post.userImage,
            ),
            title: Text(post.userName, style: AppTextStyles.black16Bold700),
            subtitle: Text(post.postDay, style: AppTextStyles.hint12Bold400),
          ),
          Gap(8.h),
          if (post.postDescription.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text.rich(
                TextSpan(text: post.postDescription.replaceAll(' ', '\u00A0')),
                style: AppTextStyles.black16Bold400,
                softWrap: true,
              ),
            ),
          Gap(8.h),
          if (post.images.isNotEmpty) postImage,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 5.h),
            child: Row(
              children: [
                Assets.images.like.image(width: 22.w, height: 22.h),
                Gap(5.w),
                Text(
                  '${post.likerName} and ${post.likeCount} others',
                  style: AppTextStyles.black16Bold400.copyWith(
                    color: Color(0xFF84878B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get postImage {
    switch (post.images.length) {
      case 1:
        return singleImage;
      default:
        return multipleImage;
    }
  }

  Widget get singleImage => CachedNetworkImage(
    imageUrl: post.images[0],
    width: double.infinity,
    fit: BoxFit.cover,
  );

  Widget get multipleImage => Column(
    children: [
      CachedNetworkImage(
        imageUrl: post.images[0],
        width: double.infinity,
        height: 200.h,
        fit: BoxFit.cover,
      ),
      Gap(5.h),
      Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: post.images[1],
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          Gap(5.w),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: post.images[2],
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
                if (post.images.length > 3)
                  Container(
                    color: Colors.black.withValues(alpha: 0.6),
                    height: 150.h,
                    width: double.infinity,
                  ),
                if (post.images.length > 3)
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '+${post.images.length - 3}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
