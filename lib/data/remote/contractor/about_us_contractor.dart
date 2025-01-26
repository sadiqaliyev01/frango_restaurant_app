import '../../models/remote/about_us_response.dart';

abstract class AboutUsContractor {
  Future<AboutUsResponse> getAboutUs();
}
