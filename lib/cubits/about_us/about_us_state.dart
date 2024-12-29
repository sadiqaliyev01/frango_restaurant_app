import 'package:frango_restaurant_app/data/remote/models/about_us_model.dart';

class AboutUsState {
  const AboutUsState();
}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUs aboutUs;

  AboutUsLoaded(this.aboutUs);
}

class AboutUsError extends AboutUsState {
  final String message;

  AboutUsError(this.message);
}
