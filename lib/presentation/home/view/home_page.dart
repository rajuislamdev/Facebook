import 'package:facebook/presentation/home/view/widgets/gradient_avatar.dart';
import 'package:facebook/presentation/home/view/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/text_style.dart';
import '../../../domain/models/people/people.dart';
import '../../../domain/models/post/post.dart';
import '../../../domain/models/story/story.dart';
import '../provider/provider.dart';
import 'widgets/add_story_card.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/search_field.dart';
import 'widgets/story_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            Divider(height: 5, thickness: 4),
            StoriesWidget(),
            Divider(height: 5, thickness: 4),
            PostWidget(),
            Divider(height: 5, thickness: 8),
            PeopleWidget(),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Flexible(flex: 1, child: ProfileAvatar()),
            Gap(10.w),
            Flexible(flex: 5, child: const SearchField()),
          ],
        ),
      ),
    );
  }
}

class StoriesWidget extends ConsumerWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyState = ref.watch(storyViewModelProvider);
    return storyState.when(
      data: (stories) => storyList(stories: stories),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget storyList({required List<Story> stories}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 183.h,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const AddStoryCard();
            }
            return StoryCard(story: stories[index - 1]);
          },
        ),
      ),
    );
  }
}

class PostWidget extends ConsumerWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postViewModelProvider);
    return postState.when(
      data: (posts) => postList(posts: posts),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget postList({required List<Post> posts}) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(post: posts[index]),
      separatorBuilder: (context, index) => Divider(height: 5, thickness: 4),
    );
  }
}

class PeopleWidget extends ConsumerWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final peopleState = ref.watch(peopleViewModelProvider);
    return peopleState.when(
      data:
          (people) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              peopleList(people: people),
              Gap(23.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w, bottom: 32.h),
                child: Text(
                  'People You May Know',
                  style: AppTextStyles.black16Bold700.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget peopleList({required List<People> people}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: SizedBox(
        height: 130.h,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: people.length,
          itemBuilder:
              (context, index) => Column(
                children: [
                  GradientAvatar(image: people[index].image),
                  Gap(5.h),
                  Text(
                    people[index].userName,
                    style: AppTextStyles.hint12Bold600,
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
