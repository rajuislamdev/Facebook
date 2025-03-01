import 'package:facebook/core/demo_data/data.dart';
import 'package:facebook/domain/interfaces/home_service_interface.dart';

class HomeServiceImpl implements IHomeService {
  @override
  Future<Map<String, dynamic>> getPosts() async => postData;

  @override
  Future<Map<String, dynamic>> getStories() async => storyData;

  @override
  Future<Map<String, dynamic>> getPeople() async => peopleData;
}
