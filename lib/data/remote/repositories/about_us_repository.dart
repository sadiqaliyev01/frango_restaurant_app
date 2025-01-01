import 'package:frango_restaurant_app/data/models/remote/about_us_response.dart';


import '../contractor/abut_us_contractor.dart';
import '../services/remote/about_us_service.dart';



class AboutUsRepository implements AboutUsContractor {
  final AboutUsService _service;

  AboutUsRepository(this._service);

  @override
  Future<AboutUsResponse> getAboutUs() {
    return _service.getAboutUs();
  }
}
