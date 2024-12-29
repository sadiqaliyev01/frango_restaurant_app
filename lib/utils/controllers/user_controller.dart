import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/app.dart';
import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/data/remote/services/local/local_login_service.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/navigation_extension.dart';

import '../di/locator.dart';

class UserController {
  static final loginLocalService = locator<LoginLocalService>();

  static String accessToken = loginLocalService.loginResponse!.token!;

  static void logout() async {
    await loginLocalService.clearCache();
    navKey.currentContext?.removeAll(BlocProvider<LoginCubit>(
        create: (_) => locator(), child: const LoginScreen()));
  }
}
