import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repositories/home_repo_impl.dart';
import '../../../data/repositories/interface/home_repo_interface.dart';
import '../../../data/services/home_service_impl.dart';
import '../../../domain/interfaces/home_service_interface.dart';
import '../../../domain/models/people/people.dart';
import '../../../domain/models/post/post.dart';
import '../../../domain/models/story/story.dart';
import '../viewmodel/home_view_model.dart';

// Service Provider

final homeServiceProvider = Provider<IHomeService>((ref) => HomeServiceImpl());

// Repo Provider
final homeRepoProvider = Provider<IHomeRepo>(
  (ref) => HomeRepoImpl(ref.read(homeServiceProvider)),
);

// ViewModel Providers
final storyViewModelProvider =
    StateNotifierProvider<StoryViewModel, AsyncValue<List<Story>>>(
      (ref) => StoryViewModel(ref.read(homeRepoProvider)),
    );

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, AsyncValue<List<Post>>>(
      (ref) => PostViewModel(ref.read(homeRepoProvider)),
    );

final peopleViewModelProvider =
    StateNotifierProvider<PeopleViewModel, AsyncValue<List<People>>>(
      (ref) => PeopleViewModel(ref.read(homeRepoProvider)),
    );
