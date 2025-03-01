import 'package:facebook/data/repositories/interface/home_repo_interface.dart';
import 'package:facebook/domain/models/people/people.dart';
import 'package:facebook/domain/models/post/post.dart';
import 'package:facebook/domain/models/story/story.dart';

import '../../domain/interfaces/home_service_interface.dart';

class HomeRepoImpl implements IHomeRepo {
  final IHomeService homeService;

  HomeRepoImpl(this.homeService);
  @override
  Future<List<Post>> getPosts() async {
    final data = await homeService.getPosts();
    final List<dynamic> posts = data['data'];
    final List<Post> post = posts.map((post) => Post.fromMap(post)).toList();
    return post;
  }

  @override
  Future<List<Story>> getStories() async {
    final data = await homeService.getStories();
    final List<dynamic> stories = data['data'];
    final List<Story> story =
        stories.map((story) => Story.fromMap(story)).toList();
    return story;
  }

  @override
  Future<List<People>> getPeople() async {
    final data = await homeService.getPeople();
    final List<dynamic> people = data['data'];
    return people.map((person) => People.fromMap(person)).toList();
  }
}
