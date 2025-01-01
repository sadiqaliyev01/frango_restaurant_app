import 'package:frango_restaurant_app/data/models/remote/about_us_response.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class AboutUsService {
  final endpoint = Endpoints.aboutUs;

  Future<AboutUsResponse> getAboutUs() async {
    final response = await clientDio.get(endpoint);
    if (response.statusCode.isSuccess) {
      return AboutUsResponse.fromJson(response.data);
    } else if (response.statusCode.isFailure) {
      throw Exception('About us data not found');
    }
    throw Exception('Failed to load about us data');
  }
}
