abstract class IHomeService {
  Future<Map<String, dynamic>> getStories();
  Future<Map<String, dynamic>> getPosts();
  Future<Map<String, dynamic>> getPeople();
}
