import 'package:facebook/data/repositories/interface/home_repo_interface.dart';
import 'package:facebook/domain/models/story/story.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/people/people.dart';
import '../../../domain/models/post/post.dart';

class StoryViewModel extends StateNotifier<AsyncValue<List<Story>>> {
  final IHomeRepo homeRepo;
  StoryViewModel(this.homeRepo) : super(const AsyncValue.loading()) {
    loadStories();
  }
  void loadStories() async {
    try {
      final stories = await homeRepo.getStories();
      state = AsyncValue.data(stories);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

class PostViewModel extends StateNotifier<AsyncValue<List<Post>>> {
  final IHomeRepo homeRepo;
  PostViewModel(this.homeRepo) : super(const AsyncValue.loading()) {
    loadPosts();
  }
  void loadPosts() async {
    try {
      final posts = await homeRepo.getPosts();
      state = AsyncValue.data(posts);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

class PeopleViewModel extends StateNotifier<AsyncValue<List<People>>> {
  final IHomeRepo homeRepo;
  PeopleViewModel(this.homeRepo) : super(const AsyncValue.loading()) {
    loadPeople();
  }
  void loadPeople() async {
    try {
      final people = await homeRepo.getPeople();
      state = AsyncValue.data(people);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
