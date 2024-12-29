import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_state.dart';
import 'package:frango_restaurant_app/data/remote/repositories/about_us_repository.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final AboutUsRepository _repository;

  AboutUsCubit(this._repository) : super(AboutUsLoading());

  Future<void> fetchAboutUs() async {
    try {
      final aboutUs = await _repository.getAboutUs();
      emit(AboutUsLoaded(aboutUs));
    } catch (e) {
      emit(AboutUsError('Failed to load about us data'));
    }
  }
}
