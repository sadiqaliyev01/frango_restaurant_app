import 'package:frango_restaurant_app/data/remote/models/about_us_model.dart';
import 'package:frango_restaurant_app/data/remote/services/about_us_services.dart';

class AboutUsRepository {
  final AboutUsService _service;

  AboutUsRepository(this._service);

  Future<AboutUs> getAboutUs() {
    return _service.fetchAboutUs();
  }
}
