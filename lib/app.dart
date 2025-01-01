import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'cubits/category_names/category_names_cubit.dart';
import 'data/remote/repositories/category_names_repository.dart';
import 'data/remote/repositories/meal_repository.dart';
import 'data/remote/services/remote/category_names_service.dart';
import 'data/remote/services/remote/meal_service.dart';

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('settings');
    bool isOnboardingCompleted =
        box.get('onboardingCompleted', defaultValue: false);

    return BlocProvider(
      create: (context) => LoginCubit(locator(), locator()),
      child: MaterialApp(
        navigatorKey: navKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            isOnboardingCompleted ? MultiBlocProvider(
             providers: [
               BlocProvider(create: (context) => HomeCubit()),
               BlocProvider(create: (context) =>  MealCubit(
                 MealRepository(
                   MealService(),
                 ),
               )..getMeals(),),
               BlocProvider(
                 create: (context) =>
                 CategoryNamesCubit(
                   CategoryNamesRepository(
                     CategoryNamesService(),
                   ),
                 )..getCategoryNames(),
               )
             ],
                child: const HomeScreen()) : const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
