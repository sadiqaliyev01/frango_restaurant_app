import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/remote/models/about_us_model.dart';

class AboutUsService {
  final Dio _dio;

  AboutUsService(this._dio);

  Future<AboutUs> fetchAboutUs() async {
    try {
      final response = await _dio.get('/aboutUs');
      return AboutUs.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load about us data');
    }
  }
}
