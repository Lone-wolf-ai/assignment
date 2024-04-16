import 'package:assignment/model/model.dart';
import 'package:dio/dio.dart';

class CourseService {
  final String baseUrl = 'https://getlearn-admin.getbuildfirst.com/api/course/details/1/';

  Dio _dio = Dio();

  Future<DataClass> fetchCourseDetails() async {
    try {
      Response response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        return DataClass.fromJson(response.data);
      } else {
        throw Exception('Failed to load course details');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }
}
