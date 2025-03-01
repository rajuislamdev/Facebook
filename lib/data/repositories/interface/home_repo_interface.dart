import 'package:facebook/domain/models/people/people.dart';

import '../../../domain/models/post/post.dart';
import '../../../domain/models/story/story.dart';

abstract class IHomeRepo {
  Future<List<Story>> getStories();
  Future<List<Post>> getPosts();
  Future<List<People>> getPeople();
}
