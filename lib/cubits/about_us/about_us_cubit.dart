import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/abut_us_contractor.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final AboutUsContractor _contractor;

  AboutUsCubit(this._contractor) : super(AboutUsInitial());

  Future<void> getAboutUs() async {
    try {
      emit(AboutUsLoading());
      final aboutUs = await _contractor.getAboutUs();
      log("About Us Fetched: $aboutUs");
      emit(AboutUsSuccess(aboutUs));
      log("About Us Success");
    } catch (e) {
      emit(AboutUsFailure('Failed to load about us data: $e'));
    }
  }
}
