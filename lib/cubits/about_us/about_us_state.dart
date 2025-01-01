import 'package:frango_restaurant_app/data/models/remote/about_us_response.dart';

class AboutUsState {
  const AboutUsState();
}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsSuccess extends AboutUsState {
  AboutUsSuccess(this.aboutUs);

  final AboutUsResponse aboutUs;
}

class AboutUsFailure extends AboutUsState {
  final String message;

  AboutUsFailure(this.message);
}
